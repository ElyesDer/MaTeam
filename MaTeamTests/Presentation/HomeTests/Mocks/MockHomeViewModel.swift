//
//  MockHomeViewModel.swift
//  MaTeamTests
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation
@testable import MaTeam

class MockHomeViewModel: HomeViewModelProtocol {
    
    @Published
    var searchText: String = ""
    var searchTextPublisher: Published<String>.Publisher { $searchText }
    
    @Published
    private(set) var teams: [Team] = []
    var teamsPublisher: Published<[Team]>.Publisher { $teams }
    
    @Published
    private(set) var filteredLeagues: [League] = []
    var filteredLeaguesPublisher: Published<[League]>.Publisher { $filteredLeagues }
    
    // swiftlint:disable identifier_name
    private(set) var _leagues: [League] = []
    
    @Published
    private(set) var state: HomeViewModel.HomeViewModelState = .loading
    var statePublisher: Published<HomeViewModel.HomeViewModelState>.Publisher { $state }
    
    var leagueRepository: MaTeam.LeagueRepositoryProtocol
    
    typealias Dependencies = HasLeagueRepositoryProtocol
    
    init(dependency: Dependencies) {
        self.leagueRepository = dependency.leagueRepository
    }
    
    func filter(by text: String) {
        return
    }
    
    func fetchLeagues() {
        return
    }
    
    func search(by league: String) {
        return
    }
    
}
