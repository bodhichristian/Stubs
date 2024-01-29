//
//  Venues.swift
//  Stubs
//
//  Created by christian on 1/26/24.
//

import SwiftUI


struct Venues: View {

    var body: some View {
        
        NavigationStack {
            VenueGridView()
                .navigationTitle("Venues")
                .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    Venues()
}
