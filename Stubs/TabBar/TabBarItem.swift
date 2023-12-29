//
//  TabBarItem.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case stubs, favorites, profile, artists
    
    var iconName: String {
        switch self {
        case .stubs: return "ticket"
        case .favorites: return "heart"
        case .profile: return "person"
        case .artists: return "message"
        }
    }
    
    var title: String {
        switch self {
        case .stubs: return "Stubs"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        case .artists: return "Artists"
        }
    }
    
    var color: Color {
        switch self {
        case .stubs: return .blue
        case .favorites: return .red
        case .profile: return .orange
        case .artists: return .green
        }
    }
}

