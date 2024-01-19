//
//  StubEditorNotesView.swift
//  Stubs
//
//  Created by christian on 1/4/24.
//

import SwiftUI

struct StubEditorNotes: View {
    @Binding var concertNotes: String
    
    var body: some View {
        Section("Notes"){
            TextEditor(text: $concertNotes)
                .frame(minHeight: 100)
        }
    }
}
