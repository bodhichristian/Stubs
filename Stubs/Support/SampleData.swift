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
            artist: "A Day to Remember",
            venue: "Bridgeport Amphitheatre",
            city: "Bridgeport, CT",
            date: calendar.date(from: DateComponents(year: 2022, month: 8 ,day: 9))!,
            iconName: "airpodsmax",
            accentColor: "orange",
            notes: "The lead singer's energy was electrifying! They performed my favorite song as the closing number. Bought a t-shirt as a souvenir."
        ),
        
        
        Concert(
            artist: "Thrice",
            venue: "Terminal 5",
            city: "Brooklyn, NY",
            date: calendar.date(from: DateComponents(year: 2023, month: 6 ,day: 1))!,
            iconName: "wave.3.forward",
            accentColor: "green",
            notes: "Arrived late due to traffic, missed the first two songs. The light show was mesmerizing. Made friends with the people sitting next to me."
        ),
        
        Concert(
            artist: "Bring Me The Horizon",
            venue: "Barclays Center",
            city: "Brooklyn, NY",
            date: calendar.date(from: DateComponents(year: 2022, month: 9 ,day: 22))!,
            iconName: "guitars",
            accentColor: "red",
            notes: "A mix of old hits and new tracks - great balance. The crowd sang along to every word. The band's energy was contagious."
        ),
        
        Concert(
            artist: "Blind Breed",
            venue: "The End",
            city: "Nashville, TN",
            date: calendar.date(from: DateComponents(year: 2016,month: 10,day: 5))!,
            iconName: "guitars",
            accentColor: "orange",
            notes: "This was their farewell tour - felt so emotional. The acoustic set in the middle was a pleasant surprise. Got the setlist autographed after the show!"
        ),
        
        Concert(
            artist: "Taylor Swift",
            venue: "Nissan Stadium",
            city: "Nashville, TN",
            date: calendar.date(from: DateComponents(year: 2023,month: 5,day: 7))!,
            iconName: "music.mic",
            accentColor: "cyan",
            notes: "This was a charity concert with multiple artists performing. Each performance was unique and heartfelt, contributing to the cause. The finale featured all artists on stage together, creating a memorable and powerful moment. Bought a special edition poster to support the charity."
        ),
        
        Concert(
            artist: "Billy Joel",
            venue: "Madison Square Garden",
            city: "New York, NY",
            date: calendar.date(from: DateComponents(year: 2021,month: 12,day: 20))!,
            iconName: "waveform",
            accentColor: "purple",
            notes: "Took a road trip to see this concert - totally worth it. The band played a rare B-side track. Made unforgettable memories with friends."
        ),
        
        Concert(
            artist: "Ed Sheeran",
            venue: "Hollywood Bowl",
            city: "Los Angeles, CA",
            date: calendar.date(from: DateComponents(year: 2015,month: 6,day: 15))!,
            iconName: "music.note",
            accentColor: "green",
            notes: "Took a road trip to see this concert - totally worth it. The band played a rare B-side track. Made unforgettable memories with friends."
        ),
        
        Concert(
            artist: "Usher",
            venue: "Hyde Park",
            city: "London England",
            date: calendar.date(from: DateComponents(year: 2001,month: 7,day: 15))!,
            iconName: "airpodsmax",
            accentColor: "indigo",
            notes: "A mix of old hits and new tracks - great balance. The crowd sang along to every word. The band's energy was contagious."
        ),
        
        Concert(
            artist: "Pink Floyd",
            venue: "Fete de L'Humanité",
            city: "Paris, FR",
            date: calendar.date(from: DateComponents(year: 1970,month: 9,day: 12))!,
            iconName: "music.quarternote.3",
            accentColor: "yellow",
            notes: "Outdoor venue was perfect for this band's style. Enjoyed a picnic with friends before it started. The encore was even better than expected."
        ),
        
        Concert(
            artist: "Johnny Cash",
            venue: "San Quentin Prison",
            city: "San Quentin, CA",
            date: calendar.date(from: DateComponents(year: 1969,month: 2,day: 24))!,
            iconName: "wave.3.forward",
            accentColor: "orange",
            notes: "The vocalist's range was astounding. Each song told a different story. Left feeling inspired and rejuvenated."
        ),
        
        Concert(
            artist: "Elton John",
            venue: "Troubadour",
            city: "Los Angeles, CA",
            date: calendar.date(from: DateComponents(year: 1970,month: 8,day: 25))!,
            iconName: "music.note.list",
            accentColor: "blue",
            notes: "The rhythm and beats were impossible not to dance to. Loved the unexpected encore. The night flew by too quickly."
        ),
        
        Concert(
            artist: "Elvis Presley",
            venue: "Memphis Auditorium",
            city: "Memphis, TN",
            date: calendar.date(from: DateComponents(year: 1954, month: 7, day: 30))!,
            iconName: "guitars",
            accentColor: "brown",
            notes:  "The lead singer's voice was even better live. The visual effects complemented the music perfectly. Left with a huge smile on my face."
        ),
        
        Concert(
            artist: "The Beatles",
            venue: "Shea Stadium",
            city: "New York, NY",
            date: calendar.date(from: DateComponents(year: 1965, month: 8, day: 15))!,
            iconName: "music.mic",
            accentColor: "teal",
            notes: "Rain almost ruined the concert, but the band played on. The crowd's energy was incredible, everyone singing in the rain. Lost my umbrella but it was worth it."
        ),
        
        Concert(
            artist: "Michael Jackson",
            venue: "Munich Olympic Stadium",
            city: "Munich, Germany",
            date: calendar.date(from: DateComponents(year: 1997, month: 7, day: 4))!,
            iconName: "waveform",
            accentColor: "purple",
            notes: "The fusion of rock and electronic music was mind-blowing. Dance floor was wild! Lost my voice from singing along."
        ),
        
        Concert(
            artist: "Madonna",
            venue: "Stade de France",
            city: "Paris, France",
            date: calendar.date(from: DateComponents(year: 1987, month: 9, day: 1))!,
            iconName: "music.note",
            accentColor: "indigo",
            notes: "First time seeing a jazz concert - completely blown away. The saxophone solo was unforgettable. Plan to explore more jazz music now."
        ),
        
        Concert(
            artist: "Queen",
            venue: "Wembley Stadium",
            city: "London, UK",
            date: calendar.date(from: DateComponents(year: 1986, month: 7, day: 12))!,
            iconName: "airpodsmax",
            accentColor: "green",
            notes: "Had front row seats - felt like a dream. The guitar solo gave me chills. Managed to catch a drumstick!"
        ),
        
        Concert(
            artist: "Nirvana",
            venue: "Reading Festival",
            city: "Reading, UK",
            date: calendar.date(from: DateComponents(year: 1992, month: 8, day: 30))!,
            iconName: "music.quarternote.3",
            accentColor: "brown",
            notes: "The opening act was surprisingly good, need to check out their album. Met the drummer at the merchandise stand. The main band played an extra-long set!"
        ),
        
        Concert(
            artist: "Bob Marley",
            venue: "Rainbow Theatre",
            city: "London, UK",
            date: calendar.date(from: DateComponents(year: 1977, month: 6, day: 4))!,
            iconName: "wave.3.forward",
            accentColor: "purple",
            notes: "Took my younger sister to her first concert. She was thrilled when the band played her favorite song. Bought matching band bracelets as a keepsake."
        ),
        
        Concert(
            artist: "Beyoncé",
            venue: "Coachella Valley Music and Arts Festival",
            city: "Indio, CA",
            date: calendar.date(from: DateComponents(year: 2018, month: 4, day: 14))!,
            iconName: "music.note.list",
            accentColor: "yellow",
            notes: "Stadium was packed, atmosphere was electric. Loved the new arrangements of old classics. The light sticks created a sea of stars."
        ),
        
        Concert(
            artist: "Bruce Springsteen",
            venue: "Madison Square Garden",
            city: "New York, NY",
            date: calendar.date(from: DateComponents(year: 1978, month: 9, day: 19))!,
            iconName: "guitars",
            accentColor: "orange",
            notes: "Acoustic solo performance - intimate and moving. The artist shared stories behind each song. Left feeling deeply connected to the music."
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
