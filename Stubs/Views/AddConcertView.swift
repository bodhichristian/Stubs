//
//  AddConcertView.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData

struct AddConcertView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @Query var concerts: [Concert]
    
    @State private var artist = ""
    @State private var venue = ""
    @State private var city = ""
    @State private var date = Date()
    @State private var iconName = "guitars" // Provides a default
    @State private var accentColor = "blue" // Provides a default
    
    @State private var colorOptions = Customizable.colors
    @State private var iconOptions = Customizable.icons
    
    var formNotComplete: Bool { // Returns true if any field is empty
        artist.isEmpty || venue.isEmpty || city.isEmpty
    }
  
    var body: some View {
        NavigationStack{
            Form {
                detailInput
                
                iconSelection
                
                colorSelection
            }
            .navigationTitle("Add Concert")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        addConcert()
                        dismiss()
                    }
                    .disabled(formNotComplete)
                }
            }
        }
    }
}

#Preview {
    AddConcertView()
        .modelContainer(for: Concert.self, inMemory: true)
}

extension AddConcertView {
    private var detailInput: some View {
        Section("Details") {
            TextField("Artist", text: $artist)
            TextField("Venue", text: $venue)
            TextField("City", text: $city)
            DatePicker("Date", selection: $date, displayedComponents: .date)
        }
    }
    
    private var iconSelection: some View {
        Section("Icon") {
            VStack {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(Color(colorName: accentColor)!)
                    .shadow(radius: 5, y: 8)
                
                ScrollView(.horizontal){
                    HStack(spacing: 20) {
                        ForEach(iconOptions, id: \.self) { icon in
                            
                            Button {
                                iconName = icon
                            } label: {
                                Image(systemName: icon)
                                    .font(.largeTitle)
                                    .frame(width: 40)
                            }
                        }
                    }
                    .foregroundStyle(.primary)
                }
                .padding(.vertical, 10)
            }
        }
    }
    
    private var colorSelection: some View {
        Section("Accent Color") {
            ScrollView(.horizontal){
                HStack(spacing: 20) {
                    ForEach(colorOptions, id: \.self) { color in
                        Button {
                            accentColor = color
                        } label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(Color(colorName: color)!)
                        }
                    }
                }
            }
            .shadow(radius: 5, y: 8)
            .padding(.vertical, 10)
        }
    }
    
    private func addConcert() {
        withAnimation {
            let newConcert = Concert(artist: artist,
                                     venue: venue,
                                     city: city,
                                     date: date,
                                     iconName: iconName,
                                     accentColor: accentColor)
            modelContext.insert(newConcert)
        }
    }
}

