//
//  ToolBarButtonLabel.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI
import TipKit

struct ToolbarButtonLabel: View {
    @Environment(\.colorScheme) var colorScheme

    let text: String
    let symbol: String
        
    private var textColor: Color {
        if colorScheme == .dark {
            return .black
        } else {
            return .white
        }
    }
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            
            Image(systemName: symbol)
                .symbolRenderingMode(.hierarchical)
        }
        .font(.caption)
        .foregroundStyle(textColor)
        .padding(.leading, 2)
        .padding(.vertical, 7)
        .padding(.horizontal, 15)
        .frame(width: 132, height: 36)
        .background {
            Capsule()
        }
    }
}
