//
//  RequesterTests.swift
//  MaTeamTests
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import XCTest
@testable import MaTeam

final class RequesterTests: XCTestCase {
    
    var endpoint: NetworkProvider!
    var requester: DataServiceProviderProtocol!
    
    let testingUrl = URL(string: "https://jsonplaceholder.typicode.com/posts/42")!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_get_league_success() async throws {
        
        // prepare stub
        guard let randomLeague = StubProvider.instance.leaguesEndpoints.randomElement(), let data = randomLeague.content.data(using: .utf8) else {
            assertionFailure("Can't find a valid stub element to test")
            return
        }
        
        // init endpoint
        endpoint = Endpoint(method: .get, endURL: .allLeagues)
        
        // prepare mock configuration
        MockURLProtocol.requestHandler = { urlRequest in
            guard let url = urlRequest.url, url == randomLeague.endpoint else {
                throw Requester.ServiceError.urlRequest
            }
            
            let response = HTTPURLResponse(url: randomLeague.endpoint, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        // assign configuration
        let configuration: URLSessionConfiguration = .default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        
        // setup requester
        requester = Requester(urlSession: urlSession)
        
        // execute
        guard let leagues = try? await requester.request(from: endpoint, of: Leagues.self) else {
            XCTFail("Could not parse request league")
            return
        }
        
        // test
        XCTAssertTrue(!leagues.leagues.isEmpty, "Decoded Leagues is Empty")
        
        guard let firstLeague = leagues.leagues.first else {
            XCTFail("Unable to grab first league")
            return
        }
        XCTAssertTrue(firstLeague.idLeague == "4328")
        XCTAssertTrue(firstLeague.strLeague == "English Premier League")
        XCTAssertTrue(firstLeague.strLeagueAlternate == "Premier League")
        XCTAssertTrue(firstLeague.strSport == "Soccer")
        
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
