//
//  Item.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import Foundation
import SwiftData
import MapKit

// MARK: Concert Type
// An object that represents a single concert

@Model
final class Concert {
    let uuid: UUID
    var artistName: String
    var venue: String
    var city: String
    var date: Date
    var iconName: String
    var accentColor: String
    var notes: String
    var isFavorite: Bool
    
    var venueLatitude: Double
    var venueLongitude: Double
    
    var artist: Artist  
    
    @Attribute(.externalStorage)
    var artistImageData: Data?
    @Attribute(.externalStorage)
    var bannerImageData: Data?
    
    init(
        uuid: UUID = UUID(),
        artistName: String,
        venue: String,
        city: String,
        date: Date,
        iconName: String,
        accentColor: String,
        notes: String,
        isFavorite: Bool = false,
        venueLatitude: Double,
        venueLongitude: Double,
        artist: Artist
    ) {
        self.uuid = uuid
        self.artistName = artistName
        self.venue = venue
        self.city = city
        self.date = date
        self.iconName = iconName
        self.accentColor = accentColor
        self.notes = notes
        self.isFavorite = isFavorite
        self.venueLatitude = venueLatitude
        self.venueLongitude = venueLongitude
        self.artist = artist
    }
    
   
}


