//
//  Venue.swift
//  Stubs
//
//  Created by christian on 8/4/24.
//

import Foundation
import SwiftData
import MapKit

@Model
class Venue {
    var id: UUID
    var name: String
    var coordinates: CLLocationCoordinate2D
    
    var concerts: [Concert]?
    
    init(name: String, coordinates: CLLocationCoordinate2D) {
        self.id = UUID()
        self.name = name
        self.coordinates = coordinates
    }
}
