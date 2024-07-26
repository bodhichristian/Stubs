//
//  ArtistServiceTests.swift
//  StubsTests
//
//  Created by christian on 3/15/24.
//

import XCTest

import Testing
@testable import Stubs

final class ArtistServiceTests: XCTestCase {
    
    var sut: ArtistService!
    
    override func setUp() {
        super.setUp()
        sut = ArtistService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testArtistServiceInitDefaultValues() {
        XCTAssertNil(sut.fetchedArtist)
        XCTAssertFalse(sut.fetchFailed)
    }
    
    func testArtistServiceParameterMutability() {
        let newArtist = Artist(artistName: "Adele")
        
        sut.fetchedArtist = newArtist // Simulate data fetch
        sut.fetchFailed = true // Simulate fetch failure
        
        XCTAssertEqual(sut.fetchedArtist, newArtist)
        XCTAssertTrue(sut.fetchFailed)
    }
    
    func testArtistServiceSearchSuccess() async throws {
        let expectation = XCTestExpectation(description: "Retrieve artist data.")
        let artistName = "Ariana Grande" // Known good artist query
        
        do {
            try await sut.search(for: artistName)
            XCTAssertEqual(artistName, sut.fetchedArtist?.artistName)
            expectation.fulfill()
        } catch {
            XCTFail("Failed to retrieve artist data")
        }
        
        await fulfillment(of: [expectation], timeout: 10.0)
    }
}



