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
class Venue: Identifiable, Codable {
    var id: UUID
    var name: String
    var city: String
    var latitude: Double
    var longitude: Double
    
    var concerts: [Concert]?
    
    init(name: String, city: String, coordinates: CLLocationCoordinate2D) {
        self.id = UUID()
        self.name = name
        self.city = city
        self.latitude = coordinates.latitude
        self.longitude = coordinates.longitude
    }
    
    enum CodingKeys: CodingKey {
        case id, name, city, latitude, longitude
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        city = try container.decode(String.self, forKey: .city)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
       
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(city, forKey: .city)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)

    }
}
