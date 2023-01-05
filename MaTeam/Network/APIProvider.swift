//
//  APIProvider.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation

public enum APIProvider {
    
    public static let apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "NO_TOKEN"
    
    private var baseUrl: String {
        "https://www.thesportsdb.com/api/v1/json/\(APIProvider.apiKey)/"
    }
    
    //    API 1: API pour récupérer la liste des ligues disponibles: /all_leagues.php
    case allLeagues
    
    //    API 2: API pour construire la liste des équipes d’une league: /search_all_teams.php?l=French%20Ligue%201
    case allTeamsLeague(leagueName: String)
    
    //    API 3 : API pour récupérer le détail d’une équipe: /searchteams.php?t=Paris%20SG
    case team(name: String)
    
    var rawValue: String {
        switch self {
            case .allLeagues:
                return baseUrl + "all_leagues.php"
            case .allTeamsLeague(let name):
                return baseUrl + "search_all_teams.php?l=\(name)"
            case .team(let name):
                return baseUrl + "searchteams.php?t=\(name)"
        }
    }
}
