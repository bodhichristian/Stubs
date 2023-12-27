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
    
    var accentColor: Color {
        Color(colorName: concert.accentColor)!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(spacing: 0) {
                if isEditing {
                    
                    Text("Editing ")
                        .font(.title2.bold())
                        .foregroundStyle(accentColor)
                        .transition(.asymmetric(
                            insertion:
                                    .push(from: .top),
                            removal: .push(from: .trailing)))
                    
                    
                }
                
                
                Text("Notes")
                    .font(.title2.bold())
                
 
                
                Spacer()
                
                Button {
                    withAnimation(.bouncy.speed(1.5)) {
//                    withAnimation(.easeInOut(duration: 0.4)) {
                        isEditing.toggle()
                        editingFocus.toggle()
                    }
                    
                } label: {
                    
                    
                    HStack {
                        
                        if isEditing {
                            Text("DONE")
                                .font(.callout.bold())
                                .foregroundStyle(.white)
                        }
                        
                        
                        Image(systemName: isEditing
                              ? "square.and.pencil.circle.fill"
                              : "square.and.pencil.circle"
                        )
                        .resizable()
                        .scaledToFit()
                        .frame(width: isEditing ? 20 : 25, height: isEditing ? 20 : 25)
                        .foregroundStyle(isEditing ? .white : .secondary)
                        .padding(.trailing)
                    }
                    .background {
                        Capsule()
                           
                            .frame(width: isEditing ? 100 : 0, height: isEditing ? 30 : 0 )
                            .foregroundStyle(accentColor)
                            //.shadow(color: accentColor.opacity(0.8), radius: 5, y: 7)
                            .padding(.trailing)
                        
                    }
                    //.offset(y: isEditing ? 4 : 0)
                }
                .buttonStyle(PlainButtonStyle())
                
            }
            
            TextEditor(text: $concert.notes)
                .foregroundStyle(isEditing
                                 ? accentColor
                                 : .primary)
                .frame(maxWidth: .infinity)
                .frame(minHeight: 100)
                .disabled(!isEditing)
                .focused($editingFocus)
            
            
            Divider()
                .padding(.bottom)
        }
        .padding(.top, 20)
        
        
    }
}

#Preview {
    ConcertNotesTextEditor(concert: .constant(SampleData.concerts[0]), isEditing: .constant(false))
}
