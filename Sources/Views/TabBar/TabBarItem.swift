//
//  TabBarItem.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import Foundation
import SwiftUI

enum TabBarItem: CaseIterable, Hashable {
    case stubs, artists, venues, profile
    
    var iconName: String {
        switch self {
        case .stubs: return "ticket"
        case .artists: return "music.mic"
        case .venues: return "map"
        case .profile: return "person.fill"
        }
    }
    
    var title: String {
        switch self {
        case .stubs: return "Stubs"
        case .artists: return "Artists"
        case .venues: return "Venues"
        case .profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .stubs: return .black
        case .artists: return .black
        case .venues: return .black
        case .profile: return .black
        }
    }
}

