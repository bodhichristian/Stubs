//
//  Item.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model

final class Concert {
    var artist: String
    var venue: String
    var city: String
    var date: Date
    var iconName: String
    var accentColor: String
    var isFavorite: Bool
    
    init(artist: String, venue: String, city: String, date: Date, iconName: String, accentColor: String, isFavorite: Bool = false) {
        self.artist = artist
        self.venue = venue
        self.city = city
        self.date = date
        self.iconName = iconName
        self.accentColor = accentColor
        self.isFavorite = isFavorite
    }
}
