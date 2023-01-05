//
//  Stubs.swift
//  MaTeamTests
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation
@testable import MaTeam

// swiftlint:disable all line_length

typealias StubEndpoints = [StubEndpoint]

struct StubEndpoint: Stubbeable {
    var endpoint: URL
    var content: String
}

class StubProvider {
    
    static var instance = StubProvider()
    
    var leagues: [League] = []
    var teams: [Team] = []
    
    var leaguesEndpoints: StubEndpoints = []
    
    var teamEndpoints: StubEndpoints = []
    
    private init() {
        for _ in 0...5 {
            leagues.append(
                .init(idLeague: UUID().uuidString,
                      strLeague: "League-English-\(Int.random(in: 0...50))",
                      strSport: "Sport-\(Int.random(in: 0...50))",
                      strLeagueAlternate: "Alternate-\(Int.random(in: 0...50))")
            )
            
            teams.append(
                .init(idTeam: UUID().uuidString, strTeam: "Team-Paris-\(Int.random(in: 0...50))")
            )
        }
        
        teamEndpoints
            .append(
                .init(endpoint: URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/searchteams.php?t=Paris%20SG")!,
                      content: """
                  {
                        "idTeam": "133702",
                        "idSoccerXML": "117",
                        "idAPIfootball": "98",
                        "intLoved": null,
                        "strTeam": "Ajaccio",
                        "strTeamShort": null,
                        "strAlternate": "AC Ajaccio, Athletic Club Aiacciu",
                        "intFormedYear": "1910",
                        "strSport": "Soccer",
                        "strLeague": "French Ligue 1",
                        "idLeague": "4334",
                        "strLeague2": "Coupe de France",
                        "idLeague2": "4484",
                        "strLeague3": "",
                        "strLeague4": "",
                        "strLeague5": "",
                        "strLeague6": "",
                        "strLeague7": "",
                        "strManager": "",
                        "strStadium": "Stade François Coty",
                        "strKeywords": "L'ACA",
                        "strRSS": "",
                        "strStadiumThumb": "https://www.thesportsdb.com//images//media//team//stadium//tpspsp1420759508.jpg",
                        "strStadiumDescription": "Stade François Coty is a football stadium in the Corsican city of Ajaccio, France, and the home of AC Ajaccio. Its capacity",
                        "strStadiumLocation": "Ajaccio",
                        "intStadiumCapacity": "10500",
                        "strWebsite": "ac-ajaccio.corsica",
                        "strFacebook": "www.facebook.com//ACAofficiel//",
                        "strTwitter": "twitter.com//ACAjaccio",
                        "strInstagram": "www.instagram.com//acajaccio",
                        "strDescriptionEN": "Athletic Club Ajaccio (Corsican: Athletic Club Aiacciu), commonly referred to as AC Ajaccio, ACA or simply Ajaccio, is a French association football club based in the city of Ajaccio on the island of Corsica. ",
                        "strDescriptionFR": "L'Athletic Club Ajaccio (dont le nom officiel en corse est Athletic Club Aiacciu), couramment abrégé en AC Ajaccio ou ACA, est un .",
                        "strDescriptionES": "El Athletic Club Ajaccien (conocido como AC Ajaccio).",
                        "strKitColour1": "#ED2228",
                        "strKitColour2": "#FFFFFF",
                        "strKitColour3": "",
                        "strGender": "Male",
                        "strCountry": "France",
                        "strTeamBadge": "https://www.thesportsdb.com//images//media//team//badge//qpxvwy1473505505.png",
                        "strTeamJersey": "https://www.thesportsdb.com//images//media//team//jersey//rk1n921616146043.png",
                        "strTeamLogo": "https://www.thesportsdb.com//images//media//team//logo//twttqt1420759362.png",
                        "strTeamFanart1": "https://www.thesportsdb.com//images//media//team//fanart//vsvwpy1420758594.jpg",
                        "strTeamFanart2": "https://www.thesportsdb.com//images//media//team//fanart//txxrpq1420758610.jpg",
                        "strTeamFanart3": "https://www.thesportsdb.com//images//media//team//fanart//tqvuqv1420758626.jpg",
                        "strTeamFanart4": "https://www.thesportsdb.com//images//media//team//fanart//sqrsvu1420759017.jpg",
                        "strTeamBanner": "https://www.thesportsdb.com//images//media//team//banner//upwrpx1420758932.jpg",
                        "strYoutube": "www.youtube.com//user//ACAiacciuofficiel",
                        "strLocked": "unlocked"
                      }
                  """))
        
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
