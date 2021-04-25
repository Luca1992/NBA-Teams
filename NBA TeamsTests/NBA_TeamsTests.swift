//
//  NBA_TeamsTests.swift
//  NBA TeamsTests
//
//  Created by ulixe on 24/04/21.
//

import XCTest
@testable import NBA_Teams

class NBA_TeamsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAllTeams() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let networkManager = NetworkManager()
        networkManager.getAllTeams { [weak self] (result) in
            switch result {
            case .success(let teams):
                XCTAssert(!teams.isEmpty)
            case .failure(let error):
                XCTAssert(error == nil)
            }
        }
    }

    func testPlayersByTeam() throws {
        let networkManager = NetworkManager()
        networkManager.getAllPlayersByTeam() { [weak self] (result) in
            switch result {
            case .success(let players):
                XCTAssert(!players.isEmpty)
            case .failure(let error):
                XCTAssert(error == nil)
            }
        }
    }

    func testPlayerDetail() throws {
        let networkManager = NetworkManager()
        networkManager.getPlayer(id: 1) { [weak self] (result) in
            switch result {
            case .success(_):
                XCTAssert(true)
            case .failure(let error):
                XCTAssert(error == nil)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
