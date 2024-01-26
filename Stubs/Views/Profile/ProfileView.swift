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
    
    private let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    private var tileBackgroundColor: Color {
        if colorScheme == .dark {
            return Color(white: 0.2)
        } else {
            return Color(white: 0.95)
        }
    }
    
    private var shadowColor: Color {
        if colorScheme == .dark {
            return Color(white: 0.9)
        } else {
            return .secondary
        }
    }
    
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
                            .padding(.horizontal, 10)
                            Spacer()
                            
                            
                            
                            VerticalLineBoundary()
                        }
                        .frame(width: geo.size.width * 0.78)
                        .padding(.vertical, 30)
                        
                        
                    }
                    .frame(maxHeight: geo.size.height / 3)
                    .padding()
                    
                    Spacer()
                    ScrollView {
                        
                        // LazyVGrid with bento box stats
                        LazyVGrid(columns: columns) {
                            ForEach(0..<9) { _ in
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(tileBackgroundColor)
                                    .shadow(color: shadowColor, radius: 2)
                                    .frame(height: 120)
                            }
                        }
                        .padding()

                    }
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
