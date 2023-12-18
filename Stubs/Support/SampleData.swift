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
            artist: "Bruno Mars",
            venue: "The Forum",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2021, month: 6, day: 21))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Bruno Mars turned The Forum into a funk-filled party. His charismatic performance of '24K Magic' had everyone dancing. A night of pure joy and entertainment.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Taylor Swift",
            venue: "Wembley Stadium",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2018, month: 6, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Taylor Swift's show was a spectacular display of storytelling and music. 'Delicate' was a touching and beautifully performed song. An unforgettable evening.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Lady Gaga",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2022, month: 5, day: 11))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Lady Gaga's performance was a powerful blend of art and pop. The theatricality of 'Bad Romance' was a highlight. A truly immersive experience.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Ariana Grande",
            venue: "Staples Center",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2019, month: 5, day: 7))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ariana Grande's vocal prowess was on full display. Her performance of 'Thank U, Next' was both empowering and poignant. An inspiring concert.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Billy Joel",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2016, month: 12, day: 17))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Billy Joel's timeless music resonated through the Barclays Center. 'Piano Man' created a unifying and nostalgic moment for all. A legendary performance.",
            isFavorite: true
        ),
        
        Concert(
            artist: "A Day to Remember",
            venue: "Bridgeport Amphitheatre",
            city: "Bridgeport",
            date: calendar.date(from: DateComponents(year: 2022, month: 8 ,day: 9))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "The lead singer's energy was electrifying! They performed my favorite song as the closing number. Bought a t-shirt as a souvenir.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Bring Me The Horizon",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2022, month: 9 ,day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "A mix of old hits and new tracks - great balance. The crowd sang along to every word. The band's energy was contagious."
        ),
        
        Concert(
            artist: "Blind Breed",
            venue: "The End",
            city: "Nashville",
            date: calendar.date(from: DateComponents(year: 2016,month: 10,day: 5))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "This was their farewell tour - felt so emotional. The acoustic set in the middle was a pleasant surprise. Got the setlist autographed after the show!",
            isFavorite: true
        ),
        
        Concert(
            artist: "Billy Joel",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2021,month: 12,day: 20))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Took a road trip to see this concert - totally worth it. The band played a rare B-side track. Made unforgettable memories with friends."
        ),
        
        Concert(
            artist: "Coldplay",
            venue: "Wembley Stadium",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2021, month: 7, day: 15))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Coldplay's performance was out of this world. The light show complemented their music perfectly. A memorable night under the stars.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Beyoncé",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2019, month: 9, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé ruled the stage with her incredible voice. Every song was a hit. The crowd went wild for 'Halo'.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Radiohead",
            venue: "The Hollywood Bowl",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2006, month: 6, day: 29))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Radiohead's set was a journey through sound. 'Karma Police' was a standout. The atmosphere was electric.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Taylor Swift",
            venue: "Sydney Opera House",
            city: "Sydney",
            date: calendar.date(from: DateComponents(year: 2022, month: 11, day: 3))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Taylor's show was a mix of storytelling and music. The acoustic set was intimate. Left with tears of joy.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Ed Sheeran",
            venue: "The O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2018, month: 4, day: 12))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ed Sheeran's solo performance was mesmerizing. His loop pedal mastery made it feel like a full band was playing. 'Shape of You' had everyone singing along.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Lady Gaga",
            venue: "Staples Center",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2020, month: 1, day: 30))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Lady Gaga's theatrical performance was breathtaking. The costumes, the choreography, and her voice were all perfect. The encore was a real treat!",
            isFavorite: false
        ),
        
        Concert(
            artist: "Bruno Mars",
            venue: "Tokyo Dome",
            city: "Tokyo",
            date: calendar.date(from: DateComponents(year: 2023, month: 5, day: 15))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Bruno Mars brought the funk and soul to Tokyo. His dance moves and vocal range were incredible. The energy during 'Uptown Funk' was off the charts.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Ariana Grande",
            venue: "AccorHotels Arena",
            city: "Paris",
            date: calendar.date(from: DateComponents(year: 2017, month: 8, day: 25))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ariana Grande's voice was as stunning as ever. The high notes in 'No Tears Left to Cry' gave everyone chills. A truly captivating show.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Adele",
            venue: "Royal Albert Hall",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2011, month: 9, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Adele's voice filled the Royal Albert Hall with warmth. Her rendition of 'Someone Like You' was emotionally powerful. A night of soulful music and heartfelt stories.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Drake",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2016, month: 8, day: 8))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Drake's charisma shone through in his performance. The energy when 'Hotline Bling' played was infectious. A night where hip-hop met grand spectacle.",
            isFavorite: false
        ),
        Concert(
            artist: "Kendrick Lamar",
            venue: "Staples Center",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2015, month: 10, day: 27))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Kendrick Lamar delivered a thought-provoking and intense performance. His lyrical genius was evident in every song. The crowd was completely captivated.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Rihanna",
            venue: "The O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2012, month: 11, day: 19))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Rihanna's show was a blend of pop and R&B perfection. The stage design was stunning, and her vocals were impeccable. 'Diamonds' shone the brightest that night.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Foo Fighters",
            venue: "Wembley Stadium",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2010, month: 6, day: 6))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Foo Fighters rocked Wembley with their electrifying energy. 'Everlong' was a crowd favorite. An unforgettable rock concert experience.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Drake",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2023, month: 5, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Drake's performance was a mesmerizing blend of his new and classic hits. The venue's atmosphere was electric, making for an unforgettable night.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Kendrick Lamar",
            venue: "The Forum",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2017, month: 8, day: 11))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Kendrick Lamar's concert was a masterclass in storytelling through music. His connection with the audience was profound and deeply moving.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Rihanna",
            venue: "Coachella",
            city: "Indio",
            date: calendar.date(from: DateComponents(year: 2023, month: 4, day: 15))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Rihanna's headlining at Coachella was historic. Her setlist was a perfect mix of her hits and new songs, and the stage presence was simply mesmerizing.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Foo Fighters",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2017, month: 7, day: 13))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Foo Fighters brought the house down with their relentless energy and iconic rock anthems. The crowd's response was electric throughout the show.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Beyoncé",
            venue: "Rose Bowl",
            city: "Pasadena",
            date: calendar.date(from: DateComponents(year: 2013, month: 6, day: 28))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé's stage presence was unmatched. The choreography and vocals for 'Halo' were spectacular. Truly a queen of the stage.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Elton John",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2014, month: 12, day: 4))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Elton John's performance was a journey through his hits. 'Rocket Man' was a crowd pleaser. A night of nostalgia and sing-alongs.",
            isFavorite: false
        ),
        
        Concert(
            artist: "The Rolling Stones",
            venue: "Maracanã Stadium",
            city: "Rio de Janeiro",
            date: calendar.date(from: DateComponents(year: 2016, month: 2, day: 20))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "The Rolling Stones brought rock and roll to Rio. Their energy was contagious, especially during 'Start Me Up'. A legendary performance.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Adele",
            venue: "The SSE Hydro",
            city: "Glasgow",
            date: calendar.date(from: DateComponents(year: 2016, month: 3, day: 25))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Adele's voice was mesmerizing in Glasgow. Her banter with the audience was charming. 'Someone Like You' was a tearjerker.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Billie Eilish",
            venue: "Coachella Valley Music and Arts Festival",
            city: "Indio",
            date: calendar.date(from: DateComponents(year: 2019, month: 4, day: 20))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Billie Eilish's Coachella debut was hauntingly beautiful. Her voice resonated perfectly in the desert night. 'Bad Guy' had everyone dancing.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Bruno Mars",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2018, month: 9, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Bruno Mars turned MSG into a funk and soul party. His energy was infectious, and the band was on fire. A concert that felt like a celebration.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Ariana Grande",
            venue: "The O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2019, month: 8, day: 17))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ariana Grande's vocal range was on full display at The O2. The production was top-notch. 'Thank U, Next' was a powerful finale.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Travis Scott",
            venue: "Astroworld Festival",
            city: "Houston",
            date: calendar.date(from: DateComponents(year: 2021, month: 11, day: 5))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Travis Scott's Astroworld was a wild ride. The energy in the crowd was electric. His performance of 'Sicko Mode' was the highlight.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Dua Lipa",
            venue: "Staples Center",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2022, month: 3, day: 13))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Dua Lipa's pop extravaganza was dazzling. Her dance moves and stage presence were impressive. 'Levitating' had the whole arena dancing.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Harry Styles",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2020, month: 7, day: 6))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Harry Styles' charm and talent lit up MSG. His performance was both intimate and electrifying. 'Watermelon Sugar' was a joyous sing-along.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Muse",
            venue: "O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2012, month: 10, day: 26))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Muse's concert was a high-energy, visually stunning spectacle. Their live rendition of 'Madness' was particularly mesmerizing.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Rihanna",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2016, month: 3, day: 27))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Rihanna's stage presence was absolutely captivating. The performance of 'Work' had the entire arena dancing along.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Hozier",
            venue: "Red Rocks Amphitheatre",
            city: "Morrison",
            date: calendar.date(from: DateComponents(year: 2015, month: 8, day: 2))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Hozier's soulful voice echoed through Red Rocks. His performance of 'Take Me to Church' was hauntingly beautiful and left the audience in awe.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Tame Impala",
            venue: "Alexandra Palace",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2016, month: 2, day: 13))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Tame Impala's psychedelic sound created an incredible atmosphere. The visuals for 'Let It Happen' were mesmerizing, adding to the surreal experience.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Alabama Shakes",
            venue: "The Greek Theatre",
            city: "Berkeley",
            date: calendar.date(from: DateComponents(year: 2015, month: 5, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Alabama Shakes brought raw energy and soulful blues to The Greek. Brittany Howard's vocals were powerful and moving, especially during 'Sound & Color'.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Vance Joy",
            venue: "Sydney Opera House",
            city: "Sydney",
            date: calendar.date(from: DateComponents(year: 2017, month: 11, day: 23))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Vance Joy's intimate performance was a delight. His storytelling through songs like 'Riptide' connected deeply with the audience.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Florence + The Machine",
            venue: "Hollywood Bowl",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2015, month: 10, day: 17))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Florence Welch's ethereal presence and voice captivated everyone at the Hollywood Bowl. 'Dog Days Are Over' had the entire crowd on their feet.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Beyoncé",
            venue: "The O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2016, month: 7, day: 14))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé's performance was a spectacular blend of vocals and visuals. The energy during 'Formation' was incredible. A truly empowering concert experience.",
            isFavorite: true
        ),
        Concert(
            artist: "Coldplay",
            venue: "Rose Bowl",
            city: "Pasadena",
            date: calendar.date(from: DateComponents(year: 2017, month: 10, day: 6))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Coldplay's concert was a kaleidoscope of colors and sounds. The live version of 'Fix You' was emotionally stirring. The band connected beautifully with the audience.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Ed Sheeran",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2021, month: 9, day: 30))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ed Sheeran's one-man show was a masterpiece of musical talent. His performance of 'Perfect' was a highlight, leaving many in the audience teary-eyed.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Adele",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2016, month: 11, day: 4))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Adele's voice resonated with soulful depth throughout the Barclays Center. Her humorous interactions with the audience added a lovely personal touch to the night.",
            isFavorite: false
        ),
        
        Concert(
            artist: "Radiohead",
            venue: "The Hollywood Bowl",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2017, month: 4, day: 18))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Radiohead delivered an otherworldly experience with their experimental sounds. 'Creep' was a surprising and much-celebrated addition to the setlist.",
            isFavorite: true
        ),
        
        Concert(
            artist: "Adele",
            venue: "The O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2023, month: 3, day: 5))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Adele's performance was breathtakingly beautiful, filled with emotional depth and vocal prowess. The intimacy of her interaction with the audience was heartwarming.",
            isFavorite: true
        ),

        Concert(
            artist: "Beyoncé",
            venue: "SoFi Stadium",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2023, month: 6, day: 14))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé's show was a dazzling display of artistry and empowerment. Her performance was a blend of spectacular visuals, dance, and incredible vocals.",
            isFavorite: true
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
