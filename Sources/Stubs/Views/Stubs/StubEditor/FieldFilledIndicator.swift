//
//  AddConcertDetailRow.swift
//  Stubs
//
//  Created by christian on 12/16/23.
//

import SwiftUI

struct FieldFilledIndicator: View {
    @Binding var fieldFilled: Bool
    
    var body: some View {
        HStack {

            Image(systemName: fieldFilled ? "play.circle": "play.circle.fill")
                .foregroundStyle(fieldFilled
                                 ? .gray
                                 : .green)
        }
    }
}

#Preview {
    FieldFilledIndicator(fieldFilled: .constant(false))
}
