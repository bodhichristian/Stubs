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
            Image(uiImage: UIImage(data: concert.artist?.bannerImageData ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .clipped()
            
                
            TileBase()
        }
        .contentShape(RoundedRectangle(cornerRadius: 10)) 
    }
}
