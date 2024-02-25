//
//  DebugData.swift
//  Stubs
//
//  Created by christian on 1/18/24.
//

import Foundation
import SwiftData

let calendar = Calendar.current


struct DebugData {
    static let artists = ["Adele", "Beyoncé", "Green Day", "Metallica", "Kendrick Lamar", "Fall Out Boy",  "John Mayer", "Paramore", "Red Hot Chili Peppers", "My Chemical Romance", "Coheed & Cambria", "Circa Survive", "Thrice", "Eminem", "Madonna", "Bruno Mars" ,"The Weeknd", "Ariana Grande","Billie Eilish", "A Day to Remember", "AC/DC", "Dua Lipa" ,"Travis Scott", "Taking Back Sunday", "Deftones", "Bad Bunny", "Harry Styles", "Lana Del Rey" ,"Sia", "Yellowcard", "Khalid", "Sam Smith", "Tame Impala", "Avenged Sevenfold", "Incubus", "Linkin Park", "Explosions in the Sky", "System of a Down"]
    
    static let venues: [(name: String, city: String, latitude: Double, longitude: Double)] = [
        ("Madison Square Garden", "New York", 40.7505, -73.9934),
        ("The O2 Arena", "London", 51.5033, 0.0032),
        ("Sydney Opera House", "Sydney", -33.8568, 151.2153),
        ("Red Rocks Amphitheatre", "Denver", 39.6654, -105.2057),
        ("Wembley Stadium", "London", 51.556, -0.2795),
        ("Hollywood Bowl", "Los Angeles", 34.1122, -118.3391),
        ("AT&T Stadium", "Arlington", 32.7473, -97.0945),
        ("Barclays", "Brooklyn", 40.6829, -73.9752),
        ("The Moody Theatre", "Austin", 30.2652, -97.7470),
        ("Tokyo Dome", "Tokyo", 35.6251, 139.7752),
        ("NRG Stadium", "Houston", 29.6847, -95.4107),
        ("The Forum", "Inglewood", 33.9581, -118.3417),
        ("The Gorge Amphitheatre", "George", 47.6133, -122.3315),
        ("Paramount Theatre", "Seattle", 47.6133, -122.3315),
        ("Ryman Auditorium", "Nashville", 36.1616, -86.7782),
        ("The Fillmore", "San Francisco", 37.7840, -122.4333),
        ("The Tabernacle", "Atlanta", 33.7580, -84.3915),
        ("House of Blues", "Chicago", 41.8884, -87.6265),
        ("The Bowery Ballroom", "New York", 40.7209, -73.9938),
        ("First Avenue", "Minneapolis", 44.9784, -93.2760),
        ("The Orpheum Theatre", "Los Angeles", 34.0448, -118.2550)
    ]
    
    static let notes = [
        "Just got back from an amazing concert! The energy in the venue was absolutely electric, and the artist's performance was unforgettable. Can't wait to go to another show like this!",
        "Tonight's concert was a once-in-a-lifetime experience. The lighting and sound were perfectly synchronized, creating an incredible atmosphere. The crowd was so engaged, singing along to every song.",
        "I'm still buzzing from the concert I attended tonight. The artist played all my favorite songs, and the encore was mind-blowing. Truly an evening I won't soon forget.",
        "The concert tonight was phenomenal. The opening act was a pleasant surprise, setting the stage for an unforgettable main performance. The energy from the crowd was contagious!",
        "What an incredible show! The venue was packed, and the artist had such a commanding presence on stage. The finale was spectacular, leaving everyone wanting more.",
        "Just experienced the best concert of my life. Every song was performed flawlessly, and the connection between the artist and the audience was so genuine. I'm still in awe of the talent I witnessed.",
        "Tonight's concert was an absolute blast. The setlist was a perfect mix of old hits and new favorites. The entire venue was on their feet, dancing and singing along.",
        "I can't believe how amazing the concert was tonight! The visuals were stunning, and the sound quality was top-notch. The artist's performance was both powerful and emotive.",
        "Just came back from a breathtaking concert. The artist's voice was even more incredible live, and the band was on point. The crowd's energy was infectious, making it a night to remember.",
        "Attending tonight's concert was an unforgettable experience. The artist interacted with the crowd, creating a personal and intimate atmosphere. The final song was so moving, it brought tears to my eyes.",
        "What an electrifying concert! The artist's energy was through the roof, and the special effects were like nothing I've ever seen. This show set a new standard for live performances.",
        "Tonight's concert was exceptional. The artist's performance was both passionate and energetic, captivating the entire audience. The night ended with a standing ovation - well deserved!",
        "I'm still reeling from the incredible concert I attended tonight. The set design was stunning, adding an extra layer of magic to the performance. The artist's connection with the audience was palpable.",
        "Just attended a phenomenal concert. The artist's charisma and stage presence were undeniable, and the live renditions of the songs were even better than the recordings. The crowd was completely mesmerized.",
        "Tonight's concert was an absolute joy to attend. The artist's interaction with the fans was so heartwarming, and the music was phenomenal. It was a night filled with great vibes and unforgettable memories.",
        "I'm so glad I went to the concert tonight. The atmosphere was electric, and the artist delivered an incredible performance. The final song had the entire audience singing along - a perfect end to the night.",
        "What an outstanding concert! The artist's talent truly shone on stage, and the band was fantastic. The energy in the venue was amazing, making it an unforgettable night.",
        "Tonight's concert was a blast. The light show was spectacular, perfectly complementing the music. The artist's performance was both powerful and touching, resonating with everyone in the audience.",
        "Just left an amazing concert. The sound system was phenomenal, making every note crystal clear. The artist's performance was captivating, and the encore left the crowd roaring for more.",
        "Attending tonight's concert was a dream come true. The venue was buzzing with excitement, and the artist did not disappoint. The music, the lights, the atmosphere - everything was perfect.",
        "Tonight's concert was nothing short of magical. The setlist was a perfect blend of new and classic hits, performed with incredible energy. The connection between the artist and the audience was beautiful.",
        "I just experienced an unforgettable concert. The performance was spectacular, with stunning visuals and impeccable sound. The artist truly connected with the audience, making it a personal and memorable experience.",
        "What a fantastic concert! The stage setup was incredible, and the artist's performance was emotionally charged. The crowd's response was overwhelming, creating a truly vibrant atmosphere.",
        "Just got home from an incredible concert. The artist had an amazing stage presence, and the music was out of this world. The entire experience was exhilarating, from start to finish.",
        "Tonight's concert was a masterpiece. The artist's performance was full of energy and emotion, leaving the audience spellbound. The encore was the highlight of the night, ending the show on a high note.",
        "I can't get over how amazing the concert was tonight. The venue was the perfect setting, and the artist's performance was both powerful and intimate. The crowd's enthusiasm made the experience even more special.",
        "Tonight's concert exceeded all my expectations. The artist's live performance was even more impressive than their recordings. The energy in the venue was contagious, making for an unforgettable evening.",
        "Just witnessed an incredible concert. The combination of the artist's talent and the stunning venue created a magical experience. The crowd was fully engaged, making the atmosphere electric.",
        "I'm still in awe of the concert I attended tonight. The artist's voice was mesmerizing, and the band was phenomenal. The audience was completely captivated, creating a memorable and emotional experience.",
        "Attending the concert tonight was an amazing experience. The artist delivered an outstanding performance, and the crowd's energy was incredible. It was a night of great music and unforgettable moments."
    ]
    
    
}
