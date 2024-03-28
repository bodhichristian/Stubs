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
        
        let concert = Concert(venue: "Barclays", city: "Brooklyn")
        
        do {
            let coordinates = try await service.getCoordinates(for: concert)
            
            // Assert new values not equal to default values
            XCTAssertNotEqual(coordinates.0, 0.0)
            XCTAssertNotEqual(coordinates.1, 0.0)
        } catch {
            XCTFail("Failed to get coordinates.")
        }
    }
}




