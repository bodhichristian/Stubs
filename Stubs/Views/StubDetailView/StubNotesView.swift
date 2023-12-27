//
//  ConcertNotesTextEditor.swift
//  Stubs
//
//  Created by christian on 12/19/23.
//

import SwiftUI

struct StubNotesView: View {
    
    @Binding var concert: Concert
    
    @Binding var isEditing: Bool
    
    @FocusState private var editingFocus: Bool
    
    var accentColor: Color {
        Color(colorName: concert.accentColor)!
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(spacing: 0) {
                if isEditing {
                    
                    Text("Editing ")
                        .font(.title2.bold())
                        .foregroundStyle(accentColor)
                        .transition(.asymmetric(
                            insertion:
                                    .push(from: .leading),
                            removal: .push(from: .trailing)))
                    
                    
                }
                
                
                Text("Notes")
                    .font(.title2.bold())
                
                
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        isEditing.toggle()
                        editingFocus.toggle()
                    }
                    
                } label: {
                    
                    
                    HStack {
                        
                        if isEditing {
                            Text("DONE")
                                .font(.callout.bold())
                                .foregroundStyle(.white)
                                .shadow(radius: 2)
                                .transition(.asymmetric(insertion: .push(from: .trailing), removal: .push(from: .leading)))
                        }
                        
                        
                        Image(systemName:"square.and.pencil.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: isEditing ? 18 : 25, height: isEditing ? 18 : 25)
                            .foregroundStyle(isEditing ? .white : accentColor)
                            .shadow(radius: isEditing ? 2 : 0)
                            .padding(.trailing)
                    }
                    .background {
                        if isEditing {
                            Capsule()
                            
                                .frame(width: 100, height: 30)
                                .foregroundStyle(accentColor.opacity(0.8))
                                .shadow(radius: 2, y: 4)
                                .padding(.trailing)
                                .transition(.asymmetric(insertion: .push(from: .trailing), removal: .push(from: .leading)))
                        }
                    }
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
                .offset(x: -5)
            
            Divider()
                .padding(.bottom)
        }
        .padding(.top, 20)
        
        
    }
}

#Preview {
    StubNotesView(concert: .constant(SampleData.concerts[0]), isEditing: .constant(false))
}
