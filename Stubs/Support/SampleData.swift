//
//  ExampleConcerts.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import Foundation
import SwiftData

let calendar = Calendar.current

struct SampleData {
    // Create a static array of Sample Concerts
    static let concerts: [Concert] = [
        Concert(
            artist: "Blind Breed",
            venue: "The End",
            city: "Nashville, TN",
            date: calendar.date(from: DateComponents(year: 2016,month: 10,day: 5))!,
            iconName: "guitars",
            accentColor: "orange"
        ),
        
        Concert(
            artist: "Taylor Swift",
            venue: "Nissan Stadium",
            city: "Nashville, TN",
            date: calendar.date(from: DateComponents(year: 2023,month: 5,day: 7))!,
            iconName: "music.mic",
            accentColor: "cyan"
        ),
        
        Concert(
            artist: "Billy Joel",
            venue: "Madison Square Garden",
            city: "New York, NY",
            date: calendar.date(from: DateComponents(year: 2021,month: 12,day: 20))!,
            iconName: "waveform",
            accentColor: "purple"
        ),
        
        Concert(
            artist: "Ed Sheeran",
            venue: "Hollywood Bowl",
            city: "Los Angeles, CA",
            date: calendar.date(from: DateComponents(year: 2015,month: 6,day: 15))!,
            iconName: "music.note",
            accentColor: "green"
        ),
        
        Concert(
            artist: "Usher",
            venue: "Hyde Park",
            city: "London England",
            date: calendar.date(from: DateComponents(year: 2001,month: 7,day: 15))!,
            iconName: "airpodsmax",
            accentColor: "indigo"
        ),
        
        Concert(
            artist: "Pink Floyd",
            venue: "Fete de L'Humanité",
            city: "Paris, FR",
            date: calendar.date(from: DateComponents(year: 1970,month: 9,day: 12))!,
            iconName: "music.quarternote.3",
            accentColor: "yellow"
        ),
        
        Concert(
            artist: "Johnny Cash",
            venue: "San Quentin Prison",
            city: "San Quentin, CA",
            date: calendar.date(from: DateComponents(year: 1969,month: 2,day: 24))!,
            iconName: "wave.3.forward",
            accentColor: "orange"
        ),
        
        Concert(
            artist: "Elton John",
            venue: "Troubadour",
            city: "Los Angeles, CA",
            date: calendar.date(from: DateComponents(year: 1970,month: 8,day: 25))!,
            iconName: "music.note.list",
            accentColor: "blue"
        ),
        
        Concert(
            artist: "Elvis Presley",
            venue: "Memphis Auditorium",
            city: "Memphis, TN",
            date: calendar.date(from: DateComponents(year: 1954, month: 7, day: 30))!,
            iconName: "guitars",
            accentColor: "brown"
        ),
        
        Concert(
            artist: "The Beatles",
            venue: "Shea Stadium",
            city: "New York, NY",
            date: calendar.date(from: DateComponents(year: 1965, month: 8, day: 15))!,
            iconName: "music.mic",
            accentColor: "teal"
        ),
        
        Concert(
            artist: "Michael Jackson",
            venue: "Munich Olympic Stadium",
            city: "Munich, Germany",
            date: calendar.date(from: DateComponents(year: 1997, month: 7, day: 4))!,
            iconName: "waveform",
            accentColor: "purple"
        ),
        
        Concert(
            artist: "Madonna",
            venue: "Stade de France",
            city: "Paris, France",
            date: calendar.date(from: DateComponents(year: 1987, month: 9, day: 1))!,
            iconName: "music.note",
            accentColor: "indigo"
        ),
        
        Concert(
            artist: "Queen",
            venue: "Wembley Stadium",
            city: "London, UK",
            date: calendar.date(from: DateComponents(year: 1986, month: 7, day: 12))!,
            iconName: "airpodsmax",
            accentColor: "green"
        ),
        
        Concert(
            artist: "Nirvana",
            venue: "Reading Festival",
            city: "Reading, UK",
            date: calendar.date(from: DateComponents(year: 1992, month: 8, day: 30))!,
            iconName: "music.quarternote.3",
            accentColor: "brown"
        ),
        
        Concert(
            artist: "Bob Marley",
            venue: "Rainbow Theatre",
            city: "London, UK",
            date: calendar.date(from: DateComponents(year: 1977, month: 6, day: 4))!,
            iconName: "wave.3.forward",
            accentColor: "purple"
        ),
        
        Concert(
            artist: "Beyoncé",
            venue: "Coachella Valley Music and Arts Festival",
            city: "Indio, CA",
            date: calendar.date(from: DateComponents(year: 2018, month: 4, day: 14))!,
            iconName: "music.note.list",
            accentColor: "yellow"
        ),
        
        Concert(
            artist: "Bruce Springsteen",
            venue: "Madison Square Garden",
            city: "New York, NY",
            date: calendar.date(from: DateComponents(year: 1978, month: 9, day: 19))!,
            iconName: "guitars",
            accentColor: "orange"
        )
    ]
    
    // Add Sample Data to a view's ModelContext
    let concertCount = concerts.count

    func addSampleData(to modelContext: ModelContext) {
        for i in 0..<concertCount {
            modelContext.insert(SampleData.concerts[i])
        }
    }
}
