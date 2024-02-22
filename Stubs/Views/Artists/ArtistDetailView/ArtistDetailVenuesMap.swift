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
    
    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    
    private var displayStub: Concert {
        return concerts[0]
    }
    
    private var venues: [Concert] {
        var uniqueVenues = Set<String>()
        
        return concerts.filter { concert in
            if !uniqueVenues.contains(concert.venue) {
                uniqueVenues.insert(concert.venue)
                return true
            }
            return false
        }
    }
        
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                HStack {
                    
                    TileBase()
                        .frame(
                            width: 100,
                            height: 110
                        )
                        .overlay{
                            VStack {
                                ArtistStubStatView(
                                    count: concerts.count,
                                    statNameSingular: "Stub",
                                    statNamePlural: "Stubs"
                                )
                                
                                ArtistStubStatView(
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
                                    updateMapPosition(latitude: concert.venueLatitude, longitude: concert.venueLongitude)
                                }
                            }
                    }
                }
                .padding(5)
                
            }
            
            Map(position: $position) {
                ForEach(concerts, id: \.uuid) { concert in
                    Marker(
                        concert.venue,
                        coordinate: CLLocationCoordinate2D(
                            latitude: concert.venueLatitude,
                            longitude: concert.venueLongitude
                        )
                    )
                }
            }
            .mapStyle(
                .standard(
                    elevation: .realistic,
                    pointsOfInterest: .excludingAll
                )
            )
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onAppear {
                updateMapPosition(latitude: displayStub.venueLatitude, longitude: displayStub.venueLongitude)
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
