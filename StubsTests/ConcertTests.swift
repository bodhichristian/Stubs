//
//  ConcertTests.swift
//  StubsTests
//
//  Created by christian on 3/14/24.
//

import XCTest
@testable import Stubs

final class ConcertTests: XCTestCase {
    let test = TestFunctions()
    
    func testConcertInitiatlizationWithoutArtist() {
        // arranage (given)
        let uuid = UUID()
        let artistName = "Artist"
        let venue = "Venue"
        let city = "City"
        let date = Date()
        let iconName = "person"
        let accentColor = "blue"
        let notes = "Notes"
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
        XCTAssertEqual(concert.venueLatitude, venueLatitude)
        XCTAssertEqual(concert.venueLongitude, venueLongitude)
        XCTAssertFalse(concert.isFavorite)
    }
}




