//
//  ArtistDetailVenuesMap.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import SwiftUI
import SwiftData
import MapKit

struct ArtistDetailVenuesMap: View {
    // Pass in filteredConcerts from ArtistDetailView
    let concerts: [Concert]
    let cameraDistance: Double = 500
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    
    private var displayStub: Concert {
        return concerts[0]
    }
    
    private var venues: [Concert] {
        var uniqueVenues = Set<String>()
        
        return concerts.filter { concert in
            if !uniqueVenues.contains(concert.venueName) {
                uniqueVenues.insert(concert.venueName)
                return true
            }
            return false
        }
    }
        
    var body: some View {
        VStack(alignment: .leading) {
            Map(position: $position) {
                ForEach(concerts, id: \.uuid) { concert in
                    Marker(
                        concert.venueName,
                        coordinate: CLLocationCoordinate2D(
                            latitude: concert.venue?.latitude ?? 0.0,
                            longitude: concert.venue?.longitude ?? 0.0
                        )
                    )
                }
            }
            .mapStyle(
                .imagery(
                    elevation: .realistic
                )
            )
            .frame(maxWidth: .infinity)
            .frame(height: sizeClass == .compact ? 270 : 380)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onAppear {
                updateMapPosition(latitude: displayStub.venue?.latitude ?? 0.0, longitude: displayStub.venue?.longitude ?? 0.0)
            }
            
            ScrollView(.horizontal) {
                HStack {
                    
                    TileBase()
                        .frame(
                            width: 130,
                            height: 110
                        )
                        .overlay{
                            VStack {
                                StatViewLabel(
                                    count: concerts.count,
                                    statNameSingular: "Stub",
                                    statNamePlural: "Stubs"
                                )
                                
                                StatViewLabel(
                                    count: venues.count,
                                    statNameSingular: "Venue",
                                    statNamePlural: "Venues"
                                )
                                
                            }
                            
                        }
                    
                    ForEach(concerts, id: \.uuid) { concert in
                        ArtistStubsLabel(concert: concert)
                            .onTapGesture {
                                withAnimation(.easeInOut){
                                    updateMapPosition(latitude: concert.venue?.latitude ?? 0.0, longitude: concert.venue?.longitude ?? 0.0)
                                }
                            }
                    }
                }
                .padding(2)
            }
        }
        .padding(.horizontal)
    }
    
    private func updateMapPosition(latitude: Double, longitude: Double) {
        position = .camera(
            MapCamera(
                centerCoordinate: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude
                ),
                distance: cameraDistance,
                heading: 100,
                pitch: 80
            )
        )
    }
}
