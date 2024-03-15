//
//  ConcertTests.swift
//  StubsTests
//
//  Created by christian on 3/14/24.
//

import XCTest
@testable import Stubs

final class ConcertTests: XCTestCase {
    
    func testConcertInitiatlizationWithAllValuesProvided() {
        
        // arrange (given)
        let uuid = UUID()
        let artistName = "Artist"
        let venue = "Venue"
        let city = "City"
        let date = Date()
        let iconName = "person"
        let accentColor = "blue"
        let notes = "Notes"
        let isFavorite = true
        let venueLatitude = 50.0
        let venueLongitude = 140.0
        
        // action (when)
        let concert = Concert(
            uuid: uuid,
            artistName: artistName,
            venue: venue,
            city: city,
            date: date,
            iconName: iconName,
            accentColor: accentColor,
            notes: notes,
            isFavorite: isFavorite,
            venueLatitude: venueLatitude,
            venueLongitude: venueLongitude
        )
        
        // assert (then)
        XCTAssertEqual(concert.uuid, uuid)
        XCTAssertEqual(concert.artistName, artistName)
        XCTAssertEqual(concert.venue, venue)
        XCTAssertEqual(concert.city, city)
        XCTAssertEqual(concert.date, date)
        XCTAssertEqual(concert.iconName, iconName)
        XCTAssertEqual(concert.accentColor, accentColor)
        XCTAssertEqual(concert.notes, notes)
        XCTAssertEqual(concert.isFavorite, isFavorite)
        XCTAssertEqual(concert.venueLatitude, venueLatitude)
        XCTAssertEqual(concert.venueLongitude, venueLongitude)
    }
    
    func testConcertInitiatlizationWithDefaultValues() {
        
        // arrange (given)
        let artistName = "Artist"
        let venue = "Venue"
        let city = "City"
        let date = Date()
        let iconName = "person"
        let accentColor = "blue"
        let notes = "Notes"
        let venueLatitude = -50.0
        let venueLongitude = 140.0
        
        // action (when)
        let concert = Concert(
            artistName: artistName,
            venue: venue,
            city: city,
            date: date,
            iconName: iconName,
            accentColor: accentColor,
            notes: notes,
            venueLatitude: venueLatitude,
            venueLongitude: venueLongitude
        )
        
        // assert (then)
        XCTAssertNotNil(concert.uuid)
        XCTAssertEqual(concert.artistName, artistName)
        XCTAssertEqual(concert.venue, venue)
        XCTAssertEqual(concert.city, city)
        XCTAssertEqual(concert.date, date)
        XCTAssertEqual(concert.iconName, iconName)
        XCTAssertEqual(concert.accentColor, accentColor)
        XCTAssertEqual(concert.notes, notes)
        XCTAssertFalse(concert.isFavorite)
        XCTAssertEqual(concert.venueLatitude, venueLatitude)
        XCTAssertEqual(concert.venueLongitude, venueLongitude)
    }
    
    func testConcertPropertyUpdates() {
        
        // arrange (given)
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
        
        // action (when)
        let artistName = "Updated Artist"
        let venue = "Updated Venue"
        let city = "Updated City"
        let date = Date.now - 2
        let iconName = "person.fill"
        let accentColor = "red"
        let notes = "Updated Notes"
        let venueLatitude = 75.0
        let venueLongitude = 45.0
        
        concert.artistName = artistName
        concert.venue = venue
        concert.city = city
        concert.date = date
        concert.iconName = iconName
        concert.accentColor = accentColor
        concert.notes = notes
        concert.isFavorite = true
        concert.venueLatitude = venueLatitude
        concert.venueLongitude = venueLongitude
        
        // assert (then)
        XCTAssertEqual(concert.artistName, artistName)
        XCTAssertEqual(concert.venue, venue)
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




