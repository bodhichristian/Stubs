//
//  MultiPlatformImage.swift
//  Stubs
//
//  Created by christian on 7/21/24.
//

import SwiftUI

struct MultiPlatformImage: View {
    let data: Data
    
    var body: some View {
        #if os(iOS)
        Image(uiImage: UIImage(data: data) ?? UIImage())
        #elseif os(macOS)
        Image(nsImage: NSImage(data: data) ?? NSImage())
        #endif
    }
}

#Preview {
    MultiPlatformImage(data: Data())
}
