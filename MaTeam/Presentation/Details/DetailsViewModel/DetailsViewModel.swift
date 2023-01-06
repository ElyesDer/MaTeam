//
//  DetailsViewModel.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation

protocol DetailsViewModelProtocol: HasLeagueRepositoryProtocol {
    var teamName: String { get }
    var team: Team? { get }
    func fetchTeam(name: String)
}

class DetailsViewModel: ObservableObject, DetailsViewModelProtocol {
    
    enum DetailsViewModelState {
        case loading
        case idle
        case error
    }
    
    var team: Team?
    var teamName: String
    var leagueRepository: LeagueRepositoryProtocol
    
    @Published
    var headerUrl: URL?
    
    @Published
    var logoUrl: URL?
    
    @Published
    var teamInfo: String = ""
    
    @Published
    var paysInfo: String = ""
    
    @Published
    var championnat: String = ""
    
    @Published
    var description: String = ""
    
    @Published
    var state: DetailsViewModelState = .loading
    
    typealias Dependencies = HasLeagueRepositoryProtocol
    
    init(dependency: Dependencies, teamName: String) {
        self.leagueRepository = dependency.leagueRepository
        self.teamName = teamName
        
        fetchTeam(name: self.teamName)
    }
    
    func fetchTeam(name: String) {
        state = .loading
        Task {
            do {
                guard let team = try await self.leagueRepository.getTeamDetails(by: name).teams.first else {
                    throw NSError()
                }
                bindTeamInfoToView(with: team)
            } catch {
                state = .error
            }
        }
    }
    
    fileprivate func bindTeamInfoToView(with team: Team) {
        DispatchQueue.main.async {
            self.headerUrl = URL(string: team.strTeamBadge ?? "")
            self.logoUrl = URL(string: team.strTeamLogo  ?? "")
            self.paysInfo = team.strCountry ?? ""
            self.championnat = team.strLeague ?? ""
            self.description = team.strDescriptionEN ?? ""
            self.state = .idle
        }
    }
    
}
