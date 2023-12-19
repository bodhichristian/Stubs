//
//  ConcertNotesTextEditor.swift
//  Stubs
//
//  Created by christian on 12/19/23.
//

import SwiftUI

struct ConcertNotesTextEditor: View {
    @Binding var concert: Concert
    
    @State private var isEditing: Bool = false
    
    @FocusState private var editingFocus: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .bottom) {
                
                Text("Notes")
                    .font(.title2.bold())
                
                Spacer()
                
                if isEditing {
                    Text("EDITING")
                        .font(.callout.bold())
                        .foregroundStyle(.secondary)
                        .transition(.push(from: .top))
                        .opacity(isEditing ? 1 : 0)

                }
                
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isEditing.toggle()
                        editingFocus.toggle()
                    }
                } label: {
                    Image(systemName: isEditing
                            ? "square.and.pencil.circle.fill"
                            : "square.and.pencil"
                    )
                    .foregroundStyle(.secondary)
                    .scaledToFit()
                    //.padding()
                    .frame(width: 20, height: 20)
                }
                .buttonStyle(PlainButtonStyle())

            }
            .padding(.bottom, 10)

            TextEditor(text: $concert.notes)
                .foregroundStyle(isEditing 
                                 ? .secondary
                                 : .primary)
                .frame(maxWidth: .infinity)
                .frame(minHeight: 100)
                .disabled(!isEditing)
                .focused($editingFocus)
        }
        .padding(.top)
    }
}

#Preview {
    ConcertNotesTextEditor(concert: .constant(SampleData.concerts[0]))
}
