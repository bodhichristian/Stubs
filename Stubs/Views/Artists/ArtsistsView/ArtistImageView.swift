//
//  ArtistImageView.swift
//  Stubs
//
//  Created by christian on 2/14/24.
//

import SwiftUI

struct ArtistImageView: View {
    let imageData: Data
    
    var body: some View {
        Image(uiImage: UIImage(data: imageData) ?? UIImage())
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .shadow(color: .primary.opacity(0.5), radius: 3)
    }
}
