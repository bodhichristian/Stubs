//
//  Concert.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import Foundation
import MapKit
import SwiftData
import SwiftUI

@Model
final class Concert: Codable {
    let uuid: UUID
    var artistName: String
    var venueName: String
    var city: String
    var date: Date
    var iconName: String
    var accentColor: String
    var notes: String
    var isFavorite: Bool
    
    @Relationship var venue: Venue?
    @Relationship var artist: Artist?

//    var venueLatitude: Double
//    var venueLongitude: Double
    
    
    @Attribute(.externalStorage)
    var mapSnapshotData: Data?
    
    init(
        uuid: UUID = UUID(),
        artistName: String = "",
        venueName: String = "",
        city: String = "",
        date: Date = Date.now,
        iconName: String = "speaker.wave.3",
        accentColor: String = "blue",
        notes: String = "",
        isFavorite: Bool = false,
        artist: Artist? = nil
    ) {
        self.uuid = uuid
        self.artistName = artistName
        self.venueName = venueName
        self.city = city
        self.date = date
        self.iconName = iconName
        self.accentColor = accentColor
        self.notes = notes
        self.isFavorite = isFavorite
        self.venue = Venue(name: venueName, city: city, coordinates: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
        self.artist = artist
    }
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case artistName
        case venue
        case city
        case date
        case iconName
        case accentColor
        case notes
        case isFavorite
        case venueObj
        case venueLatitude
        case venueLongitude
        case artist
        case mapSnapshotData
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try container.decode(UUID.self, forKey: .uuid)
        artistName = try container.decode(String.self, forKey: .artistName)
        venueName = try container.decode(String.self, forKey: .venue)
        city = try container.decode(String.self, forKey: .city)
        date = try container.decode(Date.self, forKey: .date)
        iconName = try container.decode(String.self, forKey: .iconName)
        accentColor = try container.decode(String.self, forKey: .accentColor)
        notes = try container.decode(String.self, forKey: .notes)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        venue = try container.decode(Venue.self, forKey: .venueObj)
        artist = try container.decodeIfPresent(Artist.self, forKey: .artist)
        mapSnapshotData = try container.decodeIfPresent(Data.self, forKey: .mapSnapshotData)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(artistName, forKey: .artistName)
        try container.encode(venueName, forKey: .venue)
        try container.encode(city, forKey: .city)
        try container.encode(date, forKey: .date)
        try container.encode(iconName, forKey: .iconName)
        try container.encode(accentColor, forKey: .accentColor)
        try container.encode(notes, forKey: .notes)
        try container.encode(isFavorite, forKey: .isFavorite)
        try container.encode(venue, forKey: .venue)
        try container.encodeIfPresent(artist, forKey: .artist)
        try container.encodeIfPresent(mapSnapshotData, forKey: .mapSnapshotData)
    }
}


