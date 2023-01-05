//
//  Stubs.swift
//  MaTeamTests
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation
@testable import MaTeam

struct StubEndpoint: Stubbeable {
    var endpoint: URL
    var content: String
}

class StubProvider {
    
    static var instance = StubProvider()
    
    var leagues: [League] = []
    
    var leaguesEndpoints: [StubEndpoint] = []
    
    private init() {
        for _ in 0...5 {
            leagues.append(
                .init(idLeague: UUID().uuidString,
                      strLeague: "League-\(Int.random(in: 0...50))",
                      strSport: "Sport-\(Int.random(in: 0...50))",
                      strLeagueAlternate: "Alternate-\(Int.random(in: 0...50))")
            )
            
            leaguesEndpoints.append(
                .init(endpoint: URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/all_leagues.php")!,
                      content: """
                               {
                                 "leagues": [
                                   {
                                     "idLeague": "4328",
                                     "strLeague": "English Premier League",
                                     "strSport": "Soccer",
                                     "strLeagueAlternate": "Premier League"
                                   },
                                   {
                                     "idLeague": "4329",
                                     "strLeague": "English League Championship",
                                     "strSport": "Soccer",
                                     "strLeagueAlternate": "Championship"
                                   },
                                   {
                                     "idLeague": "5350",
                                     "strLeague": "U Sports Football League",
                                     "strSport": "American Football",
                                     "strLeagueAlternate": ""
                                   },
                                   {
                                     "idLeague": "5351",
                                     "strLeague": "NBL1 West",
                                     "strSport": "Basketball",
                                     "strLeagueAlternate": ""
                                   }
                                 ]
                               }
                        """)
            )
        }
    }
}
