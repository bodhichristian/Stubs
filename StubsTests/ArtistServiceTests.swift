//
//  ArtistServiceTests.swift
//  StubsTests
//
//  Created by christian on 3/15/24.
//

import XCTest
@testable import Stubs

final class ArtistServiceTests: XCTestCase {
    
    func testArtistServiceInitDefaultValues() {
        let service = ArtistService()
        
        XCTAssertNil(service.fetchedArtist)
        XCTAssertFalse(service.fetchFailed)
    }
    
    func testArtistServiceParameterMutability() {
        let service = ArtistService()
        let newArtist = Artist()
        
        service.fetchedArtist = newArtist // Simulate data fetch
        service.fetchFailed = true // Simulate fetch failure
        
        XCTAssertEqual(service.fetchedArtist, newArtist)
        XCTAssertTrue(service.fetchFailed)
    }
    
    func testArtistServiceSearchResponseSuccess() async {
        let service = ArtistService()
        let expectation = XCTestExpectation(description: "Retrieve artist data.")
        let artistName = "Ariana Grande" // Known good artist query
        
        do {
            try await service.search(for: artistName)
            XCTAssertEqual(artistName, service.fetchedArtist?.artistName)
            expectation.fulfill()
        } catch {
            XCTFail("Failed to retrieve artist data")
        }
        
        await fulfillment(of: [expectation], timeout: 10.0)
    }
}



