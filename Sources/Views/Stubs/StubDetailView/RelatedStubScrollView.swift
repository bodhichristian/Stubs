//
//  StubThumbnailScrollView.swift
//  Stubs
//
//  Created by christian on 12/17/23.
//

import SwiftUI

struct RelatedStubScrollView: View {
    @Binding var selectedConcert: Concert
    let concerts: [Concert]
    
    
    var artist: String {
        concerts.first?.artistName ?? ""
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0 ) {
            Text("\(artist) Stub Collection")
                .font(.title2.bold())
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(concerts.reversed(), id: \.uuid) { concert in
                        ArtistStubsLabel(concert: concert)
                            .onTapGesture {
                                selectedConcert = concert
                                
                            }
                    }
                }
                .padding(.vertical)
                .padding(.leading, 2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
