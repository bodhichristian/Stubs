//
//  VenueGridView.swift
//  Stubs
//
//  Created by christian on 1/27/24.
//

import SwiftUI
import SwiftData

struct VenueGridView: View {
    @Query var concerts: [Concert]
    
    
    
    private let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                    ForEach(concerts, id: \.uuid) { concert in
                        VenueGridItem(concert: concert)
                    }
                }
        }
        .padding()
        .navigationTitle("Venues")
    }
}

#Preview {
    VenueGridView()
}
