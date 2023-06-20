//
//  StubView.swift
//  Stubs
//
//  Created by christian on 6/9/23.
//

import SwiftUI

struct ConcertDetailView: View {
    @Environment(\.modelContext) var modelContext
    @State var concert: Concert
    
    @State private var showingDeleteAlert = false
    @State private var deleteAlertTitle = Text("Delete Stub")
    @State private var deleteAlertMessage = Text("Are you sure you want to delete this ticket stub?")
    
    @State private var iconTapped = false
    
    let gradient = LinearGradient( // For stub base
        colors: [.clear, .black.opacity(0.5)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        VStack{
            ZStack(alignment: .topLeading) {
                ticketStubBase
                concertDetails
            }
            actionButtons
        }
        .navigationTitle("Stub")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
        // MARK: Alert for deletion is causing an error when the delete function is finally called.
        // This does not occur if the action is called directly from the Delete button
        
//        .alert(isPresented: $showingDeleteAlert, content: {
//            Alert(
//                title: deleteAlertTitle,
//                message: deleteAlertMessage,
//                primaryButton: .default(Text("Cancel")),
//                secondaryButton: .destructive(Text("Delete"), action:  {
//                    delete()
//                }
//                                             ))
//        })
        
        
        
    }
}

extension ConcertDetailView {
    // Stub base, color, and icon
    private var ticketStubBase: some View {
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 20) // Stub Background
                .foregroundStyle(Color(colorName: concert.accentColor)!)
                .frame(height: 400)
                .shadow(radius: 6, y: 10)
                .padding()
            
            RoundedRectangle(cornerRadius: 20) // Gradient overlay
                .foregroundStyle(gradient)
                .frame(height: 400)
                .padding()
            
            Image(systemName: concert.iconName) // Concert icon
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundStyle(.white)
                .shadow(radius: 4, y: 6)
                .padding(40)
                .symbolEffect(.bounce, options: .nonRepeating, value: iconTapped)
                .onAppear {
                    iconTapped.toggle()
                }
                .onTapGesture {
                    iconTapped.toggle()
                }
                
        }
    }
    // Concert details
    private var concertDetails: some View {
        VStack(alignment: .leading) {
            Text(concert.artist)
                .font(.largeTitle).bold()
                .foregroundStyle(.white)
                .shadow(radius: 2)
            
            Text(concert.venue)
                .font(.title2).bold()
                .foregroundStyle(.black)
            
            Text(concert.city)
                .font(.title2).bold()
                .foregroundStyle(.white)
            
            Spacer()
            
            Text(concert.date.formatted(date: .abbreviated, time: .omitted)) // Format: Jun 9, 2023
                .font(.title2).bold()
                .foregroundStyle(.white)
        }
        .frame(height: 330)
        .padding(40)
    }
    // Favorite, Delete
    private var actionButtons: some View {
        HStack(spacing: 20) {
            ActionButton(titleKey: "Favorite",
                         defaultImageName: "checkmark.seal",
                         highlightedImageName: "checkmark.seal.fill",
                         accentColor: .yellow,
                         concert: $concert) {
                concert.isFavorite.toggle()
            }
            
            ActionButton(titleKey: "Delete",
                         defaultImageName: "trash",
                         accentColor: .red,
                         concert: $concert) {
                showingDeleteAlert = true
            }
        }
    }
    
    private func delete() {
        modelContext.delete(concert)
    }
}
