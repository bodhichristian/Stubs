//
//  Item.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import Foundation
import SwiftData

@Model
// MARK: Concert Type
final class Concert {
    let uuid: UUID
    var artist: String
    var venue: String
    var city: String
    var date: Date
    var iconName: String
    var accentColor: String
    var isFavorite: Bool
    
    init(uuid: UUID = UUID(), artist: String, venue: String, city: String, date: Date, iconName: String, accentColor: String, isFavorite: Bool = false) {
        self.uuid = uuid
        self.artist = artist
        self.venue = venue
        self.city = city
        self.date = date
        self.iconName = iconName
        self.accentColor = accentColor
        self.isFavorite = isFavorite
    }
    
    var decade: Int {
        let year = Calendar.current.component(.year, from: date)
        let decade = (year / 10) * 10 // Round down to the nearest decade
        return decade
    }
}
