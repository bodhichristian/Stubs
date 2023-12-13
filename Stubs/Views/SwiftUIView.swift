//
//  SwiftUIView.swift
//  Stubs
//
//  Created by christian on 12/13/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 120, height: 120)
            
            Text("Hajkdsbglakjsdblgakjbsd")
                .frame(maxWidth: 120)
                .lineLimit(1)
            Text("2010")
        }
    }
}

#Preview {
    SwiftUIView()
}
