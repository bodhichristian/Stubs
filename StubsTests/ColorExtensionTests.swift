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

    func testColorNameInitWithInconsistentCasing() {
        
        let red = Color(colorName: "red")
        let orange = Color(colorName: "Orange")
        let yellow = Color(colorName: "yeLLoW")
        let green = Color(colorName: "greeN")
        let indigo = Color(colorName: "InDiGO")
        let purple = Color(colorName: "PURPLE")
        let cyan = Color(colorName: "CYan")
        let mint = Color(colorName: "MinT")
        let teal = Color(colorName: "TEAl")
        let brown = Color(colorName: "broWn")
        let gray = Color(colorName: "gRAy")
        
        XCTAssertEqual(red, Color.red)
        XCTAssertEqual(orange, Color.orange)
        XCTAssertEqual(yellow, Color.yellow)
        XCTAssertEqual(green, Color.green)
        XCTAssertEqual(indigo, Color.indigo)
        XCTAssertEqual(purple, Color.purple)
        XCTAssertEqual(cyan, Color.cyan)
        XCTAssertEqual(mint, Color.mint)
        XCTAssertEqual(teal, Color.teal)
        XCTAssertEqual(brown, Color.brown)
        XCTAssertEqual(gray, Color.gray)
    }
    
    func testColorNameOrangeInit() {
        let orange = Color(colorName: "orange")
        XCTAssertEqual(orange, Color.orange)
    }
    
    func testColorNameDefaultsToBlue() {
        let color1 = Color(colorName: "Ron Burgundy")
        let color2 = Color(colorName: "NvrGnnGvYp")
        let color3 = Color(colorName: "01/01/00")
        let color4 = Color(colorName: "e=mc^2")
        let color5 = Color(colorName: "     ")
        
        let colors = [color1, color2, color3, color4, color5]
        
        var blueCount = 0
        
        for color in colors {
            if color == .blue {
                blueCount += 1
            }
        }
        
        XCTAssertEqual(colors.count, blueCount)
    }
}





