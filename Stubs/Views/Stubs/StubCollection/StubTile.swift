//
//  StubTile.swift
//  Stubs
//
//  Created by christian on 2/19/24.
//

import SwiftUI

struct StubTile: View {
    let concert: Concert
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(data: concert.artist.artistImageData ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            TileBase()
        }
    }
}
