//
//  StubThumbnailScrollView.swift
//  Stubs
//
//  Created by christian on 12/17/23.
//

import SwiftUI

struct StubThumbnailScrollView: View {
    let concerts: [Concert]
    
    var artist: String {
        concerts[0].artist
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0 ) {
            Text("More from \(artist)")
                .font(.title2.bold())

            ScrollView(.horizontal) {
                HStack {
                    ForEach(concerts, id: \.uuid) { concert in
                        
                        NavigationLink {
                            ConcertDetailView(concert: concert)
                        } label: {
                            StubNavLabel(concert: concert)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    StubThumbnailScrollView(concerts: [SampleData.concerts[0]])
}
