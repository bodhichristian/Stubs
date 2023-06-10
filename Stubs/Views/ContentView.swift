//
//  ContentView.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var concerts: [Concert]
    
    @State private var isAddingConcert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List { // Concerts
                    ForEach(concerts) { concert in
                        NavigationLink {
                            StubView(concert: concert)
                        } label: {
                            ConcertLabel(concert: concert)
                        }
                    }
                    .onDelete(perform: delete)
                }
                
                if concerts.isEmpty {
                    Button { // Generate Sample Data
                        withAnimation {
                            addSampleData()
                        }
                    } label: {
                        Text("Add Sample Data")
                    }
                }
            }
            .navigationTitle("Concerts")
            .sheet(isPresented: $isAddingConcert) {
                AddConcertView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem {
                    Button {
                        isAddingConcert = true
                    } label: {
                        Label("Add Concert", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Concert.self, inMemory: true)
}

extension ContentView {
    private func delete(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(concerts[index])
            }
        }
    }
    
    private func addSampleData() {
        modelContext.insert(ExampleConcerts.concert1)
        modelContext.insert(ExampleConcerts.concert2)
        modelContext.insert(ExampleConcerts.concert3)
        modelContext.insert(ExampleConcerts.concert4)
        modelContext.insert(ExampleConcerts.concert5)
        modelContext.insert(ExampleConcerts.concert6)
        modelContext.insert(ExampleConcerts.concert7)
        modelContext.insert(ExampleConcerts.concert8)
    }
}
