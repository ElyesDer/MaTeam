//
//  HomeViewModelTests.swift
//  MaTeamTests
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import XCTest
@testable import MaTeam
import Combine

final class HomeViewModelTests: XCTestCase {
    
    var endpoint: NetworkProvider!
    var requester: DataServiceProviderProtocol!
    var viewModelFactory: ViewModelFactory!
    var mockedLeagueRepository: MockLeagueRepository!
    var sut: HomeViewModelProtocol!
    
    private var cancellable = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        requester = Requester()
        mockedLeagueRepository = MockLeagueRepository()
        
        viewModelFactory = ViewModelFactory(requester: requester, leagueRepository: mockedLeagueRepository)
    }
    
    func test_first_sync_success() throws {
        
        let expectation = expectation(description: "Expect Loading state")
        
        // given
        sut = viewModelFactory.buildHomeViewModel()
        
        // test
        sut.statePublisher.sink { state in
            XCTAssertTrue(state == .loading)
            expectation.fulfill()
        }
        .store(in: &cancellable)
        
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
    func test_filter_success() async throws {
        
        // given
        sut = viewModelFactory.buildHomeViewModel()
        let searchedLeague = "English "
        
        // execute
        await self.sut.fetchLeagues()
        self.sut.filter(by: searchedLeague)
        
        // test
        guard let firstElement = self.sut.filteredLeagues.first else {
            XCTFail("Failed to grab first element")
            return
        }
        
        XCTAssertTrue(firstElement.strLeague.contains(searchedLeague))
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
