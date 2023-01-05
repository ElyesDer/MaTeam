//
//  LeagueRepositoryTests.swift
//  MaTeamTests
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import XCTest
@testable import MaTeam

final class LeagueRepositoryTests: XCTestCase {

    var zut: LeagueRepository!
    
    var endpoint: NetworkProvider!
    var requester: DataServiceProviderProtocol!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        requester = Requester()
    }
    
    func test_get_team_repository() async throws {
        
        let teamName: String = "Paris SG"
        
        // using
        zut = .init(requester: requester)
        
        // request
        let teams = try await zut.getTeamDetails(by: teamName)
        
        // test
        XCTAssertTrue(!teams.teams.isEmpty, "Decoded Teams is Empty")
        
        guard let firstTeam = teams.teams.first else {
            XCTFail("Unable to grab first Team")
            return
        }
        XCTAssertTrue(firstTeam.strTeam == teamName)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
