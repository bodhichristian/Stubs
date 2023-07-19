//
//  ItemInfoView.swift
//  Stubs
//
//  Created by christian on 7/6/23.
//

import SwiftUI
import MapKit

// MARK: ItemInfoView - SwiftUI View
// A View for displaying a Look Around Scene in a Look Around Preview

struct LookAroundView: View {
    let location: MKMapItem // Currently selected POI

    @State private var lookAroundScene: MKLookAroundScene?
    
    var body: some View {
            LookAroundPreview(initialScene: lookAroundScene)
                .overlay(alignment: .bottomTrailing) {
                    HStack {
                        Text("\(location.name ?? "")")
                    }
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(10)
                }
                .onAppear {
                    getLookAroundScene()
                }
    }
    
    func getLookAroundScene() {
        Task {
            let request = MKLookAroundSceneRequest(mapItem: location)
            lookAroundScene = try? await request.scene
        }
    }
}

#Preview {
    LookAroundView(location: MKMapItem(
        placemark: MKPlacemark(
            coordinate: CLLocationCoordinate2D(latitude: 40.7305, longitude: -73.9934)))
    )
}
