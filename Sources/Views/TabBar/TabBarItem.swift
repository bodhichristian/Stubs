//
//  TabBarItem.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import Foundation
import SwiftUI

enum TabBarItem: CaseIterable, Hashable {
    case stubs, artists, venues
    
    var iconName: String {
        switch self {
        case .stubs: return "ticket"
        case .artists: return "music.mic"
        case .venues: return "map"
        }
    }
    
    var title: String {
        switch self {
        case .stubs: return "Stubs"
        case .artists: return "Artists"
        case .venues: return "Venues"
        }
    }
    
    var color: Color {
        switch self {
        case .stubs: return .black
        case .artists: return .black
        case .venues: return .black
        }
    }
}

