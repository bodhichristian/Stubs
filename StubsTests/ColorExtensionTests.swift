//
//  ColorExtensionTests.swift
//  StubsTests
//
//  Created by christian on 3/19/24.
//

import XCTest
import SwiftUI
@testable import Stubs

final class ColorExtensionTests: XCTestCase {

    func testColorRedInitializationWithInconsistentCasing() {
        let color1 = Color(colorName: "red")
        XCTAssertEqual(color1, Color.red)
        
        let color2 = Color(colorName: "Red")
        XCTAssertEqual(color2, Color.red)
        
        let color3 = Color(colorName: "reD")
        XCTAssertEqual(color3, Color.red)
    }
    
    func testColorOrangeInitialization() {
        let orange = Color(colorName: "orange")
        XCTAssertEqual(orange, Color.orange)
    }
}
