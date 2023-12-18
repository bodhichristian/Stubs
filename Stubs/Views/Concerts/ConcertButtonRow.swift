////
////  ConcertButtonRow.swift
////  Stubs
////
////  Created by christian on 12/17/23.
////
//
//import SwiftUI
//
//struct ConcertButtonRow: View {
//    
//    @Binding var concert: Concert
//    @Binding var showingMap: Bool
//    
//    var body: some View {
//        HStack {
//            // View on Map
//            ActionButton(titleKey: "Map",
//                         systemImage: "mappin.and.ellipse",
//                         accentColor: .green,
//                         concert: $concert) {
//                showingMap = true
//            }
//            
//            // Toggle Favorite Status
//            ActionButton(titleKey: "Favorite",
//                         systemImage: "checkmark.seal",
//                         alternateSystemImage: "checkmark.seal.fill",
//                         accentColor: .yellow,
//                         concert: $concert) {
//                concert.isFavorite.toggle()
//            }
//            
//            // Delete Concert
//            ActionButton(titleKey: "Delete",
//                         systemImage: "trash",
//                         accentColor: .red,
//                         concert: $concert) {
//                modelContext.delete(concert)
//            }
//        }
//    }
//}
//
//#Preview {
//    ConcertButtonRow()
//}
