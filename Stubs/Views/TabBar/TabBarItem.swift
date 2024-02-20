//
//  TabBarItem.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case stubs, artists, profile, venues
    
    var iconName: String {
        switch self {
        case .stubs: return "ticket"
        case .profile: return "person.fill"
        case .artists: return "music.mic"
        case .venues: return "map"
        }
    }
    
    var title: String {
        switch self {
        case .stubs: return "Stubs"
        case .profile: return "Profile"
        case .artists: return "Artists"
        case .venues: return "Venues"
        }
    }
    
    var color: Color {
        switch self {
        case .stubs: return .black
        case .profile: return .black
        case .artists: return .black
        case .venues: return .black
        }
    }
}

