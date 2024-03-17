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

}
