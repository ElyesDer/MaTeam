//
//  Team.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation

// MARK: - Teams
struct Teams: Codable {
    let teams: [Team]
}

// MARK: - Team
struct Team: Codable {
    let idTeam: String
    let strTeam: String
    let idSoccerXML, idAPIfootball: String?
    let intLoved: String?
    let strTeamShort: String?
    let strAlternate, intFormedYear, strSport, strLeague: String?
    let idLeague, strLeague2, idLeague2, strLeague3: String?
    let strLeague4, strLeague5, strLeague6, strLeague7: String?
    let strManager, strStadium, strKeywords, strRSS: String?
    let strStadiumThumb: String?
    let strStadiumDescription, strStadiumLocation, intStadiumCapacity, strWebsite: String?
    let strFacebook, strTwitter, strInstagram, strDescriptionEN: String?
    let strDescriptionFR, strDescriptionES, strKitColour1, strKitColour2: String?
    let strKitColour3, strGender, strCountry: String?
    let strTeamBadge, strTeamJersey, strTeamLogo: String?
    let strTeamFanart1, strTeamFanart2, strTeamFanart3, strTeamFanart4: String?
    let strTeamBanner: String?
    let strYoutube, strLocked: String?
    
    init(idTeam: String, strTeam: String, idSoccerXML: String? = nil, idAPIfootball: String? = nil, intLoved: String? = nil, strTeamShort: String? = nil, strAlternate: String? = nil, intFormedYear: String? = nil, strSport: String? = nil, strLeague: String? = nil, idLeague: String? = nil, strLeague2: String? = nil, idLeague2: String? = nil, strLeague3: String? = nil, strLeague4: String? = nil, strLeague5: String? = nil, strLeague6: String? = nil, strLeague7: String? = nil, strManager: String? = nil, strStadium: String? = nil, strKeywords: String? = nil, strRSS: String? = nil, strStadiumThumb: String? = nil, strStadiumDescription: String? = nil, strStadiumLocation: String? = nil, intStadiumCapacity: String? = nil, strWebsite: String? = nil, strFacebook: String? = nil, strTwitter: String? = nil, strInstagram: String? = nil, strDescriptionEN: String? = nil, strDescriptionFR: String? = nil, strDescriptionES: String? = nil, strKitColour1: String? = nil, strKitColour2: String? = nil, strKitColour3: String? = nil, strGender: String? = nil, strCountry: String? = nil, strTeamBadge: String? = nil, strTeamJersey: String? = nil, strTeamLogo: String? = nil, strTeamFanart1: String? = nil, strTeamFanart2: String? = nil, strTeamFanart3: String? = nil, strTeamFanart4: String? = nil, strTeamBanner: String? = nil, strYoutube: String? = nil, strLocked: String? = nil) {
        self.idTeam = idTeam
        self.strTeam = strTeam
        self.idSoccerXML = idSoccerXML
        self.idAPIfootball = idAPIfootball
        self.intLoved = intLoved
        self.strTeamShort = strTeamShort
        self.strAlternate = strAlternate
        self.intFormedYear = intFormedYear
        self.strSport = strSport
        self.strLeague = strLeague
        self.idLeague = idLeague
        self.strLeague2 = strLeague2
        self.idLeague2 = idLeague2
        self.strLeague3 = strLeague3
        self.strLeague4 = strLeague4
        self.strLeague5 = strLeague5
        self.strLeague6 = strLeague6
        self.strLeague7 = strLeague7
        self.strManager = strManager
        self.strStadium = strStadium
        self.strKeywords = strKeywords
        self.strRSS = strRSS
        self.strStadiumThumb = strStadiumThumb
        self.strStadiumDescription = strStadiumDescription
        self.strStadiumLocation = strStadiumLocation
        self.intStadiumCapacity = intStadiumCapacity
        self.strWebsite = strWebsite
        self.strFacebook = strFacebook
        self.strTwitter = strTwitter
        self.strInstagram = strInstagram
        self.strDescriptionEN = strDescriptionEN
        self.strDescriptionFR = strDescriptionFR
        self.strDescriptionES = strDescriptionES
        self.strKitColour1 = strKitColour1
        self.strKitColour2 = strKitColour2
        self.strKitColour3 = strKitColour3
        self.strGender = strGender
        self.strCountry = strCountry
        self.strTeamBadge = strTeamBadge
        self.strTeamJersey = strTeamJersey
        self.strTeamLogo = strTeamLogo
        self.strTeamFanart1 = strTeamFanart1
        self.strTeamFanart2 = strTeamFanart2
        self.strTeamFanart3 = strTeamFanart3
        self.strTeamFanart4 = strTeamFanart4
        self.strTeamBanner = strTeamBanner
        self.strYoutube = strYoutube
        self.strLocked = strLocked
    }
}
