//
//  ArtistImageViewMac.swift
//  StubsMac
//
//  Created by christian on 7/21/24.
//

import SwiftUI

struct ArtistImageViewMac: View {
    let imageData: Data?
    
    var body: some View {
        if let imageData {
            Image(nsImage: NSImage(data: imageData) ?? NSImage())
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

#Preview {
    ArtistImageViewMac(imageData: Data())
}
