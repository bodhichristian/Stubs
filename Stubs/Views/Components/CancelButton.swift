//
//  CancelButton.swift
//  Stubs
//
//  Created by christian on 1/4/24.
//

import SwiftUI

struct CancelButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    CancelButton()
}
