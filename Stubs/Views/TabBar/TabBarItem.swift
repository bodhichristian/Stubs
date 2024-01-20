//
//  TabBarItem.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case stubs, artists, profile
    
    var iconName: String {
        switch self {
        case .stubs: return "ticket"
        case .profile: return "person.fill"
        case .artists: return "music.mic"
        }
    }
    
    var title: String {
        switch self {
        case .stubs: return "Stubs"
        case .profile: return "Profile"
        case .artists: return "Artists"
        }
    }
    
    var color: Color {
        switch self {
        case .stubs: return .blue
        case .profile: return .purple
        case .artists: return .green
        }
    }
}

