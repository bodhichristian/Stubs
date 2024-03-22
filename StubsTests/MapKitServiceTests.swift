//
//  MapKitServiceTests.swift
//  StubsTests
//
//  Created by christian on 3/21/24.
//

import XCTest
@testable import Stubs

final class MapKitServiceTests: XCTestCase {

    func testMapKitServiceInit() {
        let service = MapKitService()
        
        XCTAssertNotNil(service)
        XCTAssertEqual(service.latitude, 0)
        XCTAssertEqual(service.longitude, 0)
    }
    
    func testMapKitServiceGetCoordinatesSuccess() async {
        let service = MapKitService()
        
        let concert = Concert(
            artistName: DebugData.artists[0],
            venue: DebugData.venues[0].name,
            city: DebugData.venues[0].city,
            date: Date.now,
            iconName: StubStyle.icons[0],
            accentColor: StubStyle.colors[0],
            notes: DebugData.notes[0],
            venueLatitude: 0.0,
            venueLongitude: 0.0
        )
        
        do {
            try await service.getCoordinates(for: concert)
            
            XCTAssertNotEqual(service.latitude, 0.0)
            XCTAssertNotEqual(service.longitude, 0.0)
        } catch {
            XCTFail("Failed to get coordinates.")
        }
    }
}




