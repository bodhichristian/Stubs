////
////  ConcertCollection.swift
////  Stubs
////
////  Created by christian on 6/15/23.
////
//
//import Foundation
//import SwiftUI
//import SwiftData
//
//let calendar = Calendar.current
//
//@Model
//// MARK: Collection Model
//class ConcertCollection: Collection  {
//    var savedConcerts: [Concert]
//
//    init(concerts: [Concert]) {
//        self.savedConcerts = concerts
//    }
//    
//    // MARK: Collection Protocol
//    typealias Index = Array<Concert>.Index
//    
//    var startIndex: Index {
//        return savedConcerts.startIndex
//    }
//    
//    var endIndex: Index {
//        return savedConcerts.endIndex
//    }
//    
//    subscript(position: Index) -> Concert {
//        return savedConcerts[position]
//    }
//    
//    func index(after i: Index) -> Index {
//        return savedConcerts.index(after: i)
//    }
//    
//    var count: Int {
//        return savedConcerts.count 
//    }
//    
//    // MARK: An Array of Sample Concerts
//    static let sampleConcerts: [Concert] = [
//        Concert(
//            artist: "Blind Breed",
//            venue: "The End",
//            city: "Nashville, TN",
//            date: calendar.date(from: DateComponents(
//                year: 2016,
//                month: 10,
//                day: 5))!,
//            iconName: "guitars",
//            accentColor: "orange"),
//        
//        Concert(
//            artist: "Taylor Swift",
//            venue: "Nissan Stadium",
//            city: "Nashville, TN",
//            date: calendar.date(from: DateComponents(
//                year: 2016,
//                month: 10,
//                day: 5))!,
//            iconName: "music.mic",
//            accentColor: "blue"),
//        
//        Concert(
//            artist: "Billy Joel",
//            venue: "Madison Square Garden",
//            city: "New York, NY",
//            date: calendar.date(from: DateComponents(
//                year: 2021,
//                month: 12,
//                day: 20))!,
//            iconName: "waveform",
//            accentColor: "purple"),
//        
//        Concert(
//            artist: "Ed Sheeran",
//            venue: "Hollywood Bowl",
//            city: "Los Angeles, CA",
//            date: calendar.date(from: DateComponents(
//                year: 2015,
//                month: 6,
//                day: 15))!,
//            iconName: "music.note",
//            accentColor: "green"),
//        
//        Concert(
//            artist: "Usher",
//            venue: "Hyde Park",
//            city: "London England",
//            date: calendar.date(from: DateComponents(
//                year: 2001,
//                month: 7,
//                day: 15))!,
//            iconName: "airpodsmax",
//            accentColor: "orange"),
//        
//        Concert(
//            artist: "Pink Floyd",
//            venue: "Fete de L'Humanité",
//            city: "Paris, FR",
//            date: calendar.date(from: DateComponents(
//                year: 1970,
//                month: 9,
//                day: 12))!,
//            iconName: "music.quarternote.3",
//            accentColor: "yellow"),
//        
//        Concert(
//            artist: "Johnny Cash",
//            venue: "San Quentin Prison",
//            city: "San Quentin, CA",
//            date: calendar.date(from: DateComponents(
//                year: 1969,
//                month: 2,
//                day: 24))!,
//            iconName: "wave.3.forward",
//            accentColor: "red"),
//        
//        Concert(
//            artist: "Elton John",
//            venue: "Troubadour",
//            city: "Los Angeles, CA",
//            date: calendar.date(from: DateComponents(
//                year: 1970,
//                month: 8,
//                day: 25))!,
//            iconName: "music.note.list",
//            accentColor: "blue")
//        ]
//    
//}
//
//
