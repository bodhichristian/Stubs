//
//  ArtistTests.swift
//  StubsTests
//
//  Created by christian on 3/14/24.
//

import XCTest
@testable import Stubs

final class ArtistTests: XCTestCase {

    func testArtistInitializationWithNoValues() {
        // action
        let artist = Artist()
        // assert
        XCTAssertNotNil(artist)
    }
    
    func testArtistInitializationWithArtistNameOnly() {
        // arrange
        let artistName = "Foo Fighters"
        //action
        let artist = Artist(artistName: artistName)
        // assert
        XCTAssertEqual(artist.artistName, artistName)
        XCTAssertNil(artist.artistID)
        XCTAssertNil(artist.artistImageData)
        XCTAssertNil(artist.bannerImageData)
        XCTAssertNil(artist.bio)
        XCTAssertNil(artist.genre)
        XCTAssertNil(artist.mood)
        XCTAssertNil(artist.geo)
        XCTAssertEqual(artist.concerts, [])
 
    }
}
