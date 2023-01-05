//
//  League.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation

struct Leagues: Decodable {
    let leagues: [League]
}

struct League: Decodable {
    let idLeague, strLeague, strSport, strLeagueAlternate: String
}

extension League: Stubbeable {}
