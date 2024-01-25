//
//  ProfileView.swift
//  Stubs
//
//  Created by christian on 1/19/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var imageSelection: PhotosPickerItem?
    @State private var imageData: Data?
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack {
                    
                    // Profile Ticket Stub
                    ZStack{
                        // Base Layer
                        StubShape()
                            .foregroundStyle(.ultraThinMaterial)
                            .shadow(color: .secondary, radius: 5)
                        
                        StubShape()
                            .foregroundStyle(StubStyle.gradientOverlay)
                        
                        
                        // Veritcal Lines
                        HStack {
                            VerticalLineBoundary()
                            VStack(alignment: .leading) {
                                Text("Username")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("User since Jan 2024")
                                            .foregroundStyle(.secondary)
                                        Text("Favorite Venue")
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Spacer()
                                        
                                        Circle()
                                            .frame(width: geo.size.width / 4)
                                            .overlay(alignment: .bottomTrailing) {
                                                
                                                if let selectedImage = selectedImage {
                                                    Image(uiImage: selectedImage)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .clipShape(Circle())
                                                        .frame(width: geo.size.width / 4)
                                                }
                                                
                                                
                                                PhotosPicker(selection: $imageSelection,
                                                             matching: .images,
                                                             photoLibrary: .shared()) {
                                                    Image(systemName: "pencil.circle.fill")
                                                        .symbolRenderingMode(.multicolor)
                                                        .font(.system(size: 30))
                                                        .foregroundColor(.accentColor)
                                                }
                                                             .onChange(of: imageSelection) { _, newItem in
                                                                 // When a new item is selected, load the image
                                                                 guard let newItem = newItem else { return }
                                                                 Task {
                                                                     if let data = try? await newItem.loadTransferable(type: Data.self) {
                                                                         imageData = data
                                                                         selectedImage = UIImage(data: data)
                                                                     }
                                                                 }
                                                             }
                                                             .buttonStyle(.borderless)
                                            }
                                        
                                    }
                                }
                            }
                            Spacer()
                            
                            
                            
                            VerticalLineBoundary()
                        }
                        .frame(width: geo.size.width * 0.75)
                        .padding(.vertical, 30)
                        
                        
                    }
                    .frame(maxHeight: geo.size.height / 3)
                    .padding()
                    
                    Spacer()
                    
                    // LazyVGrid with bento box stats
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem {
                    Button {
                        // open settings
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
            }
        }
    }
}
