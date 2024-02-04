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
    var mapSnapshotData: Data?
    
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
        
        getMapSnapshot()
    }
    
    func getMapSnapshot() {
        let options = MKMapSnapshotter.Options()
        options.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: venueLatitude, longitude: venueLongitude), latitudinalMeters: 200, longitudinalMeters: 200)
        options.size = CGSize(width: 360, height: 150)
        options.scale = UIScreen.main.scale
        
        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.start { snapshot, error in
            guard let snapshot = snapshot else {
                print("Error capturing snapshot: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            self.mapSnapshotData = snapshot.image.jpegData(compressionQuality: 1.0)
        }
    }
}


