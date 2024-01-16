////
////  ImageLoader.swift
////  Stubs
////
////  Created by christian on 1/16/24.
////
//
//import Foundation
//import SwiftUI
//
//@Observable class ImageLoader {
//    
//    var image: Image?
//    var cachedImage: Image?
//    
//    var urlString: String = ""
//    
//    init(image: Image, cachedImage: Image, urlString: String) {
//        self.image = image
//        self.cachedImage = cachedImage
//        self.urlString = urlString
//    }
//    
//    func load() {
//        if let cachedImage = cachedImage {
//            self.image = cachedImage
//        } else {
//            
//            AsyncImage(url: URL(string: urlString)) { asyncImage in
//                image = asyncImage
////                    .resizable()
////                    .matchedGeometryEffect(id: artist.strArtist, in: namespace)
////                    .scaledToFit()
////                    .frame(width: 75)
////                    .clipShape(Circle())
////       
//            } placeholder: {
//                
//                Circle()
//                    .foregroundStyle(.gray)
//                    .frame(width: 75)
//                    .padding()
//                
//            }
//            
//            
//            
//            
//        }
//    }
//}
