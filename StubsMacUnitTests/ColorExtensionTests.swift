//
//  ColorExtensionTests.swift
//  StubsMacTests
//
//  Created by christian on 7/25/24.
//

import Testing
import SwiftUI
@testable import Stubs

struct ColorExtensionTests {

    @Test func inconsistentCasing() async throws {
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
        
        #expect(red == Color.red)
        #expect(orange == Color.orange)
        #expect(yellow == Color.yellow)
        #expect(green == Color.green)
        #expect(indigo == Color.indigo)
        #expect(purple == Color.purple)
        #expect(cyan == Color.cyan)
        #expect(mint == Color.mint)
        #expect(teal == Color.teal)
        #expect(brown == Color.brown)
        #expect(gray == Color.gray)
    }

    @Test func unknownColorStringDefaultBlue() {
        let color1 = Color(colorName: "Ron Burgundy")
        let color2 = Color(colorName: "afjgaAFDHAahf")
        let color3 = Color(colorName: "01/01/00")
        
        let colors = [color1, color2, color3]
        
        var blueCount = 0
        
        for color in colors {
            if color == .blue {
                blueCount += 1
            }
        }
    }
}
