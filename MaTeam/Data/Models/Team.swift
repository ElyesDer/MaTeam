//
//  Team.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation

// MARK: - Teams
struct Teams {
    let teams: [Team]
}

// MARK: - Team
struct Team: Codable {
    let idTeam, idSoccerXML, idAPIfootball: String
    let intLoved: String?
    let strTeam: String
    let strTeamShort: String?
    let strAlternate, intFormedYear, strSport, strLeague: String
    let idLeague, strLeague2, idLeague2, strLeague3: String
    let strLeague4, strLeague5, strLeague6, strLeague7: String
    let strManager, strStadium, strKeywords, strRSS: String
    let strStadiumThumb: String
    let strStadiumDescription, strStadiumLocation, intStadiumCapacity, strWebsite: String
    let strFacebook, strTwitter, strInstagram, strDescriptionEN: String
    let strDescriptionFR, strDescriptionES, strKitColour1, strKitColour2: String
    let strKitColour3, strGender, strCountry: String
    let strTeamBadge, strTeamJersey, strTeamLogo: String
    let strTeamFanart1, strTeamFanart2, strTeamFanart3, strTeamFanart4: String
    let strTeamBanner: String
    let strYoutube, strLocked: String
}
