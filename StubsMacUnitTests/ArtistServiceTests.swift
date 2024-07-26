//
//  StubsMacTests.swift
//  StubsMacTests
//
//  Created by christian on 6/29/24.
//

import Testing
@testable import Stubs

@Suite
struct ArtistServiceTests {
    var sut: ArtistService = ArtistService()
    
    @Test func testDefaultValues() {
        #expect(sut.fetchedArtist == nil)
        #expect(sut.fetchFailed == false)
    }

    @Test func artistSearch() async throws {
        let artistName = "Ariana Grande" // Known good query
        
        try await sut.search(for: artistName)
        #expect(sut.fetchedArtist?.artistName == artistName)
        
    }
}
