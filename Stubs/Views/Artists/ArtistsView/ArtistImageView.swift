//
//  ArtistImageView.swift
//  Stubs
//
//  Created by christian on 2/14/24.
//

import SwiftUI

struct ArtistImageView: View {
    let imageData: Data?
    
    var body: some View {
        if let imageData {
            Image(uiImage: UIImage(data: imageData) ?? UIImage())
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(color: .primary.opacity(0.5), radius: 3)
                .padding(.trailing, 8)
        } else {
            Circle()
                .foregroundStyle(.gray)
                .padding(.trailing, 8)
        }
    }
}
