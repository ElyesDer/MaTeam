//
//  MockLeagueRepository.swift
//  MaTeamTests
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation
@testable import MaTeam

class MockLeagueRepository: LeagueRepositoryProtocol {
    
    func getLeagues() async throws -> MaTeam.Leagues {
        return Leagues(leagues: StubProvider.instance.leagues)
    }
    
    func getAllTeamsLeague(by name: String) async throws -> MaTeam.Teams {
        return Teams(teams: StubProvider.instance.teams)
    }
    
    func getTeamDetails(by name: String) async throws -> MaTeam.Teams {
        return Teams.init(teams: StubProvider.instance.teams)
    }
    
}
