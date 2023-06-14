//
//  ExampleConcerts.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import Foundation

let calendar = Calendar.current

struct ExampleConcerts {
    static let concert1 = Concert(
        artist: "Blind Breed",
        venue: "The End",
        city: "Nashville, TN",
        date: calendar.date(from: DateComponents(
            year: 2016,
            month: 10,
            day: 5))!,
        iconName: "guitars",
        accentColor: "orange")
    
    static let concert2 = Concert(
        artist: "Taylor Swift",
        venue: "Nissan Stadium",
        city: "Nashville, TN",
        date: calendar.date(from: DateComponents(
            year: 2016,
            month: 10,
            day: 5))!,
        iconName: "music.mic",
        accentColor: "blue")
    
    static let concert3 = Concert(
        artist: "Billy Joel",
        venue: "Madison Square Garden",
        city: "New York, NY",
        date: calendar.date(from: DateComponents(
            year: 2021,
            month: 12,
            day: 20))!,
        iconName: "waveform",
        accentColor: "purple")
    
    static let concert4 = Concert(
        artist: "Ed Sheeran",
        venue: "Hollywood Bowl",
        city: "Los Angeles, CA",
        date: calendar.date(from: DateComponents(
            year: 2015,
            month: 6,
            day: 15))!,
        iconName: "music.note",
        accentColor: "green")
    
    static let concert5 = Concert(
        artist: "Usher",
        venue: "Hyde Park",
        city: "London England",
        date: calendar.date(from: DateComponents(
            year: 2001,
            month: 7,
            day: 15))!,
        iconName: "airpodsmax",
        accentColor: "orange")
    
    static let concert6 = Concert(
        artist: "Pink Floyd",
        venue: "Fete de L'Humanité",
        city: "Paris, FR",
        date: calendar.date(from: DateComponents(
            year: 1970,
            month: 9,
            day: 12))!,
        iconName: "music.quarternote.3",
        accentColor: "yellow")
    
    static let concert7 = Concert(
        artist: "Johnny Cash",
        venue: "San Quentin Prison",
        city: "San Quentin, CA",
        date: calendar.date(from: DateComponents(
            year: 1969,
            month: 2,
            day: 24))!,
        iconName: "wave.3.forward",
        accentColor: "red")
    
    static let concert8 = Concert(
        artist: "Elton John",
        venue: "Troubadour",
        city: "Los Angeles, CA",
        date: calendar.date(from: DateComponents(
            year: 1970,
            month: 8,
            day: 25))!,
        iconName: "music.note.list",
        accentColor: "blue")
}
