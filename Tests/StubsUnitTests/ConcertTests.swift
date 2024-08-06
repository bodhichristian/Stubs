//
//  ConcertTests.swift
//  StubsTests
//
//  Created by christian on 3/14/24.
//

import XCTest
@testable import Stubs

final class ConcertTests: XCTestCase {
    
    func testConcertInitWithDefaultValues() {
        
        let concert = Concert()
        
        // assert
        XCTAssertNotNil(concert.uuid)
        XCTAssertNotNil(concert.date)
        XCTAssertTrue(concert.artistName.isEmpty)
        XCTAssertTrue(concert.venueName.isEmpty)
        XCTAssertTrue(concert.city.isEmpty)
        XCTAssertTrue(concert.notes.isEmpty)
        XCTAssertFalse(concert.iconName.isEmpty)
        XCTAssertFalse(concert.accentColor.isEmpty)
        XCTAssertFalse(concert.isFavorite)
        XCTAssertEqual(concert.venueLatitude, 0.0)
        XCTAssertEqual(concert.venueLongitude, 0.0)
    }
    
    func testConcertPropertyMutability() {
        
        // arrange
        let concert = Concert(
            artistName: "Initial Artist",
            venue: "Initial Venue",
            city: "Initial City",
            date: Date(),
            iconName: "person",
            accentColor: "blue",
            notes: "Initial Notes",
            venueLatitude: -50.0,
            venueLongitude: 140
        )
        
        // act
        let artistName = "Updated Artist"
        let venue = "Updated Venue"
        let city = "Updated City"
        let date = Date.now - 2
        let iconName = "person.fill"
        let accentColor = "red"
        let notes = "Updated Notes"
        let venueLatitude = 75.0
        let venueLongitude = 45.0
        
        XCTAssertFalse(concert.isFavorite)
        
        concert.artistName = artistName
        concert.venueName = venue
        concert.city = city
        concert.date = date
        concert.iconName = iconName
        concert.accentColor = accentColor
        concert.notes = notes
        concert.isFavorite = true
        concert.venueLatitude = venueLatitude
        concert.venueLongitude = venueLongitude
        
        // assert
        XCTAssertEqual(concert.artistName, artistName)
        XCTAssertEqual(concert.venueName, venue)
        XCTAssertEqual(concert.city, city)
        XCTAssertEqual(concert.date, date)
        XCTAssertEqual(concert.iconName, iconName)
        XCTAssertEqual(concert.accentColor, accentColor)
        XCTAssertEqual(concert.notes, notes)
        XCTAssertTrue(concert.isFavorite)
        XCTAssertEqual(concert.venueLatitude, venueLatitude)
        XCTAssertEqual(concert.venueLongitude, venueLongitude)
    }
}




