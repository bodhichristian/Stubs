//
//  AlbumLabelViewPlaceholder.swift
//  Stubs
//
//  Created by christian on 1/4/24.
//

import SwiftUI

struct AlbumScrollViewPlaceholder: View {
    var body: some View {
        ForEach(0..<5) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(.secondary.opacity(0.1))
                .frame(width: 100, height: 100)
                .shadow(radius: 3, x: 5, y: 5)
                .padding(.trailing, 10)
            
        }
    }
}

#Preview {
    AlbumScrollViewPlaceholder()
}
