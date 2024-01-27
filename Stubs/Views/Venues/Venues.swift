//
//  Venues.swift
//  Stubs
//
//  Created by christian on 1/26/24.
//

import SwiftUI
import MapKit
import SwiftData

struct Venues: View {
    @Query var concerts: [Concert]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                Map {
                    ForEach(concerts, id: \.uuid) { concert in
                        
                        Marker(concert.venue, coordinate: CLLocationCoordinate2D(latitude: concert.venueLatitude, longitude: concert.venueLongitude))
                    }
                }
                .padding(.bottom, 60)
//
            }
            .navigationTitle("Venues")
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    Venues()
}
