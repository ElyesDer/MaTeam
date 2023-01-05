//
//  LeagueRepository.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation

protocol HasLeagueRepositoryProtocol {
    var leagueRepository: LeagueRepositoryProtocol { get }
}

protocol LeagueRepositoryProtocol {
    func getLeagues() async throws -> Leagues
    
    func getAllTeamsLeague(by name: String) async throws -> Teams
    
    func getTeamDetails(by name: String) async throws -> Teams
}

class LeagueRepository: LeagueRepositoryProtocol, HasDataServiceProviderProtocol {
    
    var requester: DataServiceProviderProtocol
    
    init(requester: DataServiceProviderProtocol) {
        self.requester = requester
    }
    
    func getLeagues() async throws -> Leagues {
        let provider: Endpoint = .init(method: .get, endURL: .allLeagues)
        return try await requester.request(from: provider, of: Leagues.self)
    }
    
    func getAllTeamsLeague(by name: String) async throws -> Teams {
        let provider: Endpoint = .init(method: .get, endURL: .allTeamsLeague(leagueName: name))
        return try await requester.request(from: provider, of: Teams.self)
    }
    
    func getTeamDetails(by name: String) async throws -> Teams {
        let provider: Endpoint = .init(method: .get, endURL: .team(name: name))
        return try await requester.request(from: provider, of: Teams.self)
    }
    
}
