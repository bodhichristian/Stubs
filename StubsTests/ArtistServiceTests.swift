//
//  ArtistServiceTests.swift
//  StubsTests
//
//  Created by christian on 3/15/24.
//

import XCTest
@testable import Stubs

final class ArtistServiceTests: XCTestCase {
    
    func testArtistServiceInitialization() {
        let service = ArtistService()
        
        XCTAssertNotNil(service)
    }
    
    func testArtistServiceSearchResponseEmpty() {
        let service = ArtistService()
        
        XCTAssertTrue(service.searchResponse.isEmpty)
    }
    
    func testArtistServiceDebugSearchResponseSuccess() async {
        let service = ArtistService()
        let expectation = XCTestExpectation(description: "Retrieve artist data.")
        let artistName = "Coldplay" // Example artist name
        
        do {
            let artist = try await service.debugSearch(for: artistName)
            XCTAssertNotNil(artist)
            XCTAssertNotNil(artist?.artistName)
            expectation.fulfill()
        } catch {
            XCTFail("Failed to retrieve artist data")
        }
        
        await fulfillment(of: [expectation], timeout: 10.0)
    }
}



