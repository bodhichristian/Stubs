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
        concerts[0].artist
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0 ) {
            Text("\(artist) Stubs")
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
            }
            
            Divider()
            
        }
    }
}

#Preview {
    RelatedStubScrollView(selectedConcert: .constant(SampleData.concerts[0]), concerts: [SampleData.concerts[0]])
}
