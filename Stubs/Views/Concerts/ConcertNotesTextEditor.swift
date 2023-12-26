//
//  ConcertNotesTextEditor.swift
//  Stubs
//
//  Created by christian on 12/19/23.
//

import SwiftUI

struct ConcertNotesTextEditor: View {
    
    @Binding var concert: Concert
    
    @Binding var isEditing: Bool
    
    @FocusState private var editingFocus: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                
                Text("Notes")
                    .font(.title2.bold())

                Spacer()
                
                if isEditing {
                    
                    Text("EDITING")
                        .font(.callout.bold())
                        .foregroundStyle(.secondary)
                        .transition(.push(from: .top))

                }
                
                Button {
                    
                    withAnimation(.easeInOut(duration: 0.4)) {
                        isEditing.toggle()
                        editingFocus.toggle()
                    }
                    
                } label: {
                    
                    Image(systemName: isEditing
                            ? "square.and.pencil.circle.fill"
                            : "square.and.pencil.circle"
                    )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(isEditing ? .blue: .secondary)
                    
                }
                .buttonStyle(PlainButtonStyle())

            }

            TextEditor(text: $concert.notes)
                .foregroundStyle(isEditing
                                 ? Color(colorName: concert.accentColor)!
                                 : .primary)
                .frame(maxWidth: .infinity)
                .frame(minHeight: 100)
                .disabled(!isEditing)
                .focused($editingFocus)
                
        }
        .padding(.top)
        
        Divider()
            .padding(.bottom)
    }
}

#Preview {
    ConcertNotesTextEditor(concert: .constant(SampleData.concerts[0]), isEditing: .constant(false))
}
