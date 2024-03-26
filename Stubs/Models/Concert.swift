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
    var venue: String
    var city: String
    var date: Date
    var iconName: String
    var accentColor: String
    var notes: String
    var isFavorite: Bool
    var venueLatitude: Double
    var venueLongitude: Double
    //var venueCoordinates: (Double, Double)
    
    var artist: Artist?
    
    @Attribute(.externalStorage)
    var mapSnapshotData: Data?
    
    init(
        uuid: UUID = UUID(),
        artistName: String = "",
        venue: String = "",
        city: String = "",
        date: Date = Date.now,
        iconName: String,
        accentColor: String,
        notes: String = "",
        isFavorite: Bool = false,
        venueLatitude: Double = 0.0,
        venueLongitude: Double = 0.0
        //venueCoordinates: (Double, Double) = (0.0, 0.0)
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
        //self.venueCoordinates = venueCoordinates
        //getMapSnapshot()
    }
    
    func getMapSnapshot() {
        let options = MKMapSnapshotter.Options()
        options.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: venueLatitude, longitude: venueLongitude), latitudinalMeters: 200, longitudinalMeters: 200)
        options.size = CGSize(width: 360, height: 150)
        options.scale = UIScreen.main.scale
        options.mapType = .satelliteFlyover
        options.camera = MKMapCamera(
            lookingAtCenter: CLLocationCoordinate2D(
                latitude: venueLatitude,
                longitude: venueLongitude
            ),
            fromDistance: 400,
            pitch: 70,
            heading: 0
        )
        
        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.start { snapshot, error in
            guard let snapshot = snapshot else {
                print("Error capturing snapshot: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            self.mapSnapshotData = snapshot.image.jpegData(compressionQuality: 1.0)
        }
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
        case venueLatitude
        case venueLongitude
        case artist
        case mapSnapshotData
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try container.decode(UUID.self, forKey: .uuid)
        artistName = try container.decode(String.self, forKey: .artistName)
        venue = try container.decode(String.self, forKey: .venue)
        city = try container.decode(String.self, forKey: .city)
        date = try container.decode(Date.self, forKey: .date)
        iconName = try container.decode(String.self, forKey: .iconName)
        accentColor = try container.decode(String.self, forKey: .accentColor)
        notes = try container.decode(String.self, forKey: .notes)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        venueLatitude = try container.decode(Double.self, forKey: .venueLatitude)
        venueLongitude = try container.decode(Double.self, forKey: .venueLongitude)
        artist = try container.decodeIfPresent(Artist.self, forKey: .artist)
        mapSnapshotData = try container.decodeIfPresent(Data.self, forKey: .mapSnapshotData)
        getMapSnapshot()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(artistName, forKey: .artistName)
        try container.encode(venue, forKey: .venue)
        try container.encode(city, forKey: .city)
        try container.encode(date, forKey: .date)
        try container.encode(iconName, forKey: .iconName)
        try container.encode(accentColor, forKey: .accentColor)
        try container.encode(notes, forKey: .notes)
        try container.encode(isFavorite, forKey: .isFavorite)
        try container.encode(venueLatitude, forKey: .venueLatitude)
        try container.encode(venueLongitude, forKey: .venueLongitude)
        try container.encodeIfPresent(artist, forKey: .artist)
        try container.encodeIfPresent(mapSnapshotData, forKey: .mapSnapshotData)
    }
}


