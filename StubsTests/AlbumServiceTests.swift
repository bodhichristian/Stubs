//
//  AlbumServiceTests.swift
//  StubsTests
//
//  Created by christian on 3/17/24.
//

import XCTest
@testable import Stubs

final class AlbumServiceTests: XCTestCase {

    func testAlbumServiceInitialization() {
        let service = AlbumService()
        
        XCTAssertNotNil(service)
    }
    
    func testAlbumServiceSearchResponseEmptyByDefault() {
        let service = AlbumService()
        
        XCTAssertTrue(service.albums.isEmpty)
    }
    
    func testAlbumServiceSearchResponseSuccess() async {
        let service = AlbumService()
        let artistID = "111255" // Known valid Artist ID for Madonna
        
        do {
            try await service.searchAlbums(for: artistID)
            XCTAssertFalse(service.albums.isEmpty)
        } catch {
            XCTFail("Failed to retrieve Album data for Artist ID: \(artistID)")
        }
    }

    func testAlbumServiceSearchResponseFailsWithoutValidArtistID() async {
        let service = AlbumService()
        let testString = "Elvis Presley"
        
        // searchAlbums(for artist:) needs a valid Artist ID from TheAudioDB to properly fetch Album data
        do {
            try await service.searchAlbums(for: testString) // Should throw error
        } catch {
            XCTAssertTrue(service.albums.isEmpty)
        }
    }
}
