//
//  Extension-Color.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import Foundation
import SwiftUI

extension Color {
    init?(colorName: String) {
        switch colorName {
        case "red":
            self = .red
        case "orange":
            self = .orange
        case "yellow":
            self = .yellow
        case "green":
            self = .green
        case "indigo":
            self = .indigo
        case "purple":
            self = .purple
        case "teal":
            self = .teal
        case "cyan":
            self = .cyan
        case "mint":
            self = .mint
        case "brown":
            self = .brown
        case "gray":
            self = .gray
        default:
            self = .blue
        }
    }
}
