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
        let artistName = test.randomString()
        let venue = test.randomString()
        let city = test.randomString()
        let date = Date()
        let iconName = test.randomString()
        let accentColor = test.randomString()
        let notes = test.randomString()
        let venueLatitude = Double.random(in: -90...90)
        let venueLongitude = Double.random(in: 0...180)
        
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
        XCTAssertEqual(concert.artistName, artistName)
        XCTAssertEqual(concert.venue, venue)
        XCTAssertEqual(concert.city, city)
        XCTAssertEqual(concert.date, date)
        XCTAssertEqual(concert.iconName, iconName)
        XCTAssertEqual(concert.accentColor, accentColor)
        XCTAssertEqual(concert.notes, notes)
        XCTAssertEqual(concert.venueLatitude, venueLatitude)
        XCTAssertEqual(concert.venueLongitude, venueLongitude)
        
        XCTAssertEqual(concert.isFavorite, false)
    }
}
