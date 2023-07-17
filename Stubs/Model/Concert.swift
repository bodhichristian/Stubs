//
//  Item.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import Foundation
import SwiftData
import YouTubeKit

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
    var youTubeQuery: String
    
    init(uuid: UUID = UUID(),
         artist: String,
         venue: String,
         city: String,
         date: Date,
         iconName: String,
         accentColor: String,
         isFavorite: Bool = false,
         youTubeQuery: String = "") {
        self.uuid = uuid
        self.artist = artist
        self.venue = venue
        self.city = city
        self.date = date
        self.iconName = iconName
        self.accentColor = accentColor
        self.isFavorite = isFavorite
        self.youTubeQuery = createYouTubeQuery()
    }
    
    // Create the query to search YouTube
    private func createYouTubeQuery() -> String {
        // Concatenate the necessary strings for the query
        let query = artist + " live at " + venue + " " + city + " " + date.formatted()
        
        return query
    }
}
