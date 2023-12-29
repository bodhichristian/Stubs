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
            artist: "Adele",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2016, month: 11, day: 4))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Adele's voice resonated with soulful depth throughout the Barclays Center. Her humorous interactions with the audience added a lovely personal touch to the night.",
            isFavorite: false,
            venueLatitude: 40.6829,
            venueLongitude: -73.9752
        ),
        
        Concert(
            artist: "Adele",
            venue: "Royal Albert Hall",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2015, month: 9, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Adele's voice filled the Royal Albert Hall with warmth. Her rendition of 'Someone Like You' was emotionally powerful. A night of soulful music and heartfelt stories.",
            isFavorite: true,
            venueLatitude: 51.501,
            venueLongitude: 0.1774
            
        ),
        
        Concert(
            artist: "Adele",
            venue: "The SSE Hydro",
            city: "Glasgow",
            date: calendar.date(from: DateComponents(year: 2016, month: 3, day: 25))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Adele's voice was mesmerizing in Glasgow. Her banter with the audience was charming. 'Someone Like You' was a tearjerker.",
            isFavorite: false,
            venueLatitude: 55.8609,
            venueLongitude: -4.2873
            
        ),
        
        Concert(
            artist: "Ariana Grande",
            venue: "Staples Center",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2019, month: 5, day: 7))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ariana Grande's vocal prowess was on full display. Her performance of 'Thank U, Next' was both empowering and poignant. An inspiring concert.",
            isFavorite: false,
            venueLatitude: 34.043,
            venueLongitude: -118.2673
            
        ),
        
        Concert(
            artist: "Ariana Grande",
            venue: "AccorHotels Arena",
            city: "Paris",
            date: calendar.date(from: DateComponents(year: 2017, month: 8, day: 25))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ariana Grande's voice was as stunning as ever. The high notes in 'No Tears Left to Cry' gave everyone chills. A truly captivating show.",
            isFavorite: false,
            venueLatitude: 48.8388,
            venueLongitude: 2.3782
            
        ),
        
        Concert(
            artist: "Ariana Grande",
            venue: "The O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2019, month: 8, day: 17))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ariana Grande's vocal range was on full display at The O2. The production was top-notch. 'Thank U, Next' was a powerful finale.",
            isFavorite: true,
            venueLatitude: 51.5033,
            venueLongitude: 0.0032
            
        ),
        
        Concert(
            artist: "Beyoncé",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2019, month: 9, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé ruled the stage with her incredible voice. Every song was a hit. The crowd went wild for 'Halo'.",
            isFavorite: true,
            venueLatitude: 40.7505,
            venueLongitude: -73.9934
            
        ),
        
        Concert(
            artist: "Beyoncé",
            venue: "The O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2016, month: 7, day: 14))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé's performance was a spectacular blend of vocals and visuals. The energy during 'Formation' was incredible. A truly empowering concert experience.",
            isFavorite: true,
            venueLatitude: 51.5033,
            venueLongitude: 0.0032
            
        ),
        
        Concert(
            artist: "Beyoncé",
            venue: "SoFi Stadium",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2023, month: 6, day: 14))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé's show was a dazzling display of artistry and empowerment. Her performance was a blend of spectacular visuals, dance, and incredible vocals.",
            isFavorite: true,
            venueLatitude: 33.9534,
            venueLongitude: -118.3387
            
        ),
        
        Concert(
            artist: "Beyoncé",
            venue: "Rose Bowl",
            city: "Pasadena",
            date: calendar.date(from: DateComponents(year: 2015, month: 6, day: 28))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé's stage presence was unmatched. The choreography and vocals for 'Halo' were spectacular. Truly a queen of the stage.",
            isFavorite: true,
            venueLatitude: 34.1613,
            venueLongitude: -118.1676
            
        ),
        
        
        
        
        Concert(
            artist: "Billy Joel",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2016, month: 12, day: 17))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Billy Joel's timeless music resonated through the Barclays Center. 'Piano Man' created a unifying and nostalgic moment for all. A legendary performance.",
            isFavorite: true,
            venueLatitude: 40.6829,
            venueLongitude: -73.9752
            
        ),

        Concert(
            artist: "Billy Joel",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2021,month: 12,day: 20))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Took a road trip to see this concert - totally worth it. The band played a rare B-side track. Made unforgettable memories with friends.",
            venueLatitude: 40.7505,
            venueLongitude: -73.9934
            
        ),
        
        
        Concert(
            artist: "Bring Me The Horizon",
            venue: "Budapest Park",
            city: "Budapest",
            date: calendar.date(from: DateComponents(year: 2023, month: 7, day: 9))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "An intense night of music as Bring Me The Horizon dominated Budapest Park with their powerful sound.",
            isFavorite: true,
            venueLatitude: 47.4724,
            venueLongitude: 19.0656
            
        ),
        
        Concert(
            artist: "Bring Me The Horizon",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2022, month: 9 ,day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "A mix of old hits and new tracks - great balance. The crowd sang along to every word. The band's energy was contagious.",
            venueLatitude: 40.6829,
            venueLongitude: -73.9752
            
        ),
        
        Concert(
            artist: "Bring Me The Horizon",
            venue: "Zepp DiverCity",
            city: "Tokyo",
            date: calendar.date(from: DateComponents(year: 2020, month: 11, day: 21))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "The audience was entranced as Bring Me The Horizon delivered a mind-blowing performance at Zepp DiverCity.",
            isFavorite: true,
            venueLatitude: 35.6251,
            venueLongitude: 139.7752
            
        ),
        
        Concert(
            artist: "Bruno Mars",
            venue: "The Forum",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2021, month: 6, day: 21))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Bruno Mars turned The Forum into a funk-filled party. His charismatic performance of '24K Magic' had everyone dancing. A night of pure joy and entertainment.",
            isFavorite: true,
            venueLatitude: Double.random(in: -60.0...60.0),
            venueLongitude: Double.random(in: -60.0...60.0)
            
        ),
        
        Concert(
            artist: "Bruno Mars",
            venue: "Tokyo Dome",
            city: "Tokyo",
            date: calendar.date(from: DateComponents(year: 2023, month: 5, day: 15))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Bruno Mars brought the funk and soul to Tokyo. His dance moves and vocal range were incredible. The energy during 'Uptown Funk' was off the charts.",
            isFavorite: true,
            venueLatitude: 35.7055,
            venueLongitude: 139.7519
            
        ),



        Concert(
            artist: "Bring Me The Horizon",
            venue: "Aragon Ballroom",
            city: "Chicago",
            date: calendar.date(from: DateComponents(year: 2022, month: 1, day: 30))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "The energy was palpable as Bring Me The Horizon took over the Aragon Ballroom with their electrifying performance.",
            isFavorite: true,
            venueLatitude: 41.9694,
            venueLongitude: -87.658
            
        ),
        
        
        
        Concert(
            artist: "Bring Me The Horizon",
            venue: "Alexandra Palace",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2021, month: 5, day: 17))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Bring Me The Horizon unleashed a fierce set at Alexandra Palace, with fans echoing every lyric.",
            isFavorite: true,
            venueLatitude: 51.5942,
            venueLongitude: -0.1308
            
        ),
        
        Concert(
            artist: "Green Day",
            venue: "Slane Castle",
            city: "Meath",
            date: calendar.date(from: DateComponents(year: 2021, month: 8, day: 28))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Green Day rocked the historic Slane Castle with a set that spanned their decades-long career.",
            isFavorite: true,
            venueLatitude: 53.7092,
            venueLongitude: -6.5613
            
        ),
        
        Concert(
            artist: "Green Day",
            venue: "Estadio San Marcos",
            city: "Lima",
            date: calendar.date(from: DateComponents(year: 2023, month: 4, day: 9))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "The crowd roared as Green Day delivered a night of unforgettable music and raw energy in Lima.",
            isFavorite: true,
            venueLatitude: -12.056,
            venueLongitude: -77.0802
            
        ),

        Concert(
            artist: "Green Day",
            venue: "Wembley Stadium",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2019, month: 6, day: 11))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Green Day's dynamic performance at Wembley Stadium left fans buzzing with adrenaline and singing along to every song.",
            isFavorite: true,
            venueLatitude: 51.556,
            venueLongitude: -0.2795
            
        ),
        
        Concert(
            artist: "Billie Eilish",
            venue: "O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2022, month: 6, day: 10))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "With her captivating performance, Billie Eilish owned the stage at the O2 Arena, leaving fans in awe of her talent.",
            isFavorite: true,
            venueLatitude: 51.5033,
            venueLongitude: 0.0032

        ),
        
        Concert(
            artist: "Rihanna",
            venue: "The O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2017, month: 11, day: 19))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Rihanna's show was a blend of pop and R&B perfection. The stage design was stunning, and her vocals were impeccable. 'Diamonds' shone the brightest that night.",
            isFavorite: false,
            venueLatitude: 51.5033,
            venueLongitude: 0.0032
            
        ),
        
        Concert(
            artist: "Rihanna",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2022, month: 3, day: 12))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Rihanna captivated everyone with her powerful vocals and dynamic stage presence at the Barclays Center.",
            isFavorite: true,
            venueLatitude: 40.6829,
            venueLongitude: -73.9752
            
        ),
        
        Concert(
            artist: "Foo Fighters",
            venue: "Wembley Stadium",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2018, month: 6, day: 6))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Foo Fighters rocked Wembley with their electrifying energy. 'Everlong' was a crowd favorite. An unforgettable rock concert experience.",
            isFavorite: true,
            venueLatitude: 51.556,
            venueLongitude: -0.2795
            
        ),
        
        Concert(
            artist: "Foo Fighters",
            venue: "Wembley Stadium",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2018, month: 6, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "An unforgettable night at Wembley as Foo Fighters delivered a masterclass in rock music.",
            isFavorite: true,
            venueLatitude: 51.556,
            venueLongitude: -0.2795
            
        ),
        
        Concert(
            artist: "Billie Eilish",
            venue: "AccorHotels Arena",
            city: "Paris",
            date: calendar.date(from: DateComponents(year: 2022, month: 3, day: 21))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "The crowd at AccorHotels Arena was electrified by Billie Eilish's emotional and powerful performance.",
            isFavorite: true,
            venueLatitude: 48.8388,
            venueLongitude: 2.3782
            
        ),
        
        Concert(
            artist: "Foo Fighters",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2017, month: 7, day: 13))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Foo Fighters brought the house down with their relentless energy and iconic rock anthems. The crowd's response was electric throughout the show.",
            isFavorite: true,
            venueLatitude: 40.7505,
            venueLongitude: -73.9934
            
        ),
        

        
        Concert(
            artist: "Elton John",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2014, month: 12, day: 4))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Elton John's performance was a journey through his hits. 'Rocket Man' was a crowd pleaser. A night of nostalgia and sing-alongs.",
            isFavorite: false,
            venueLatitude: 40.7505,
            venueLongitude: -73.9934
            
        ),
        
        Concert(
            artist: "The Rolling Stones",
            venue: "Maracanã Stadium",
            city: "Rio de Janeiro",
            date: calendar.date(from: DateComponents(year: 2016, month: 2, day: 20))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "The Rolling Stones brought rock and roll to Rio. Their energy was contagious, especially during 'Start Me Up'. A legendary performance.",
            isFavorite: true,
            venueLatitude: -22.9129,
            venueLongitude: -43.2302
            
        ),
        
        Concert(
            artist: "Billie Eilish",
            venue: "Coachella Valley Music and Arts Festival",
            city: "Indio",
            date: calendar.date(from: DateComponents(year: 2019, month: 4, day: 20))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Billie Eilish's Coachella debut was hauntingly beautiful. Her voice resonated perfectly in the desert night. 'Bad Guy' had everyone dancing.",
            isFavorite: true,
            venueLatitude: 33.6784,
            venueLongitude: -116.2372
            
        ),
        
        Concert(
            artist: "Bruno Mars",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2018, month: 9, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Bruno Mars turned MSG into a funk and soul party. His energy was infectious, and the band was on fire. A concert that felt like a celebration.",
            isFavorite: false,
            venueLatitude: 40.7505,
            venueLongitude: -73.9934
            
        ),
        

        
        Concert(
            artist: "Green Day",
            venue: "Tokyo Dome",
            city: "Tokyo",
            date: calendar.date(from: DateComponents(year: 2022, month: 1, day: 15))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Green Day's explosive energy filled the Tokyo Dome, captivating the audience with their punk rock anthems.",
            isFavorite: true,
            venueLatitude: 35.7055,
            venueLongitude: 139.7519
            
        ),
        
        Concert(
            artist: "Foo Fighters",
            venue: "Sydney Opera House",
            city: "Sydney",
            date: calendar.date(from: DateComponents(year: 2019, month: 11, day: 30))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "The iconic venue resonated with the powerful performance of Foo Fighters, a night to remember.",
            isFavorite: true,
            venueLatitude: -33.8568,
            venueLongitude: 151.2153
            
        ),
        
        
        Concert(
            artist: "Foo Fighters",
            venue: "Berlin Olympiastadion",
            city: "Berlin",
            date: calendar.date(from: DateComponents(year: 2021, month: 7, day: 8))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "The energy was palpable as Foo Fighters took the stage in Berlin, leaving an indelible mark on all who attended.",
            isFavorite: true,
            venueLatitude: 52.5147,
            venueLongitude: 13.2395
            
        ),
        
        Concert(
            artist: "Rihanna",
            venue: "Rod Laver Arena",
            city: "Melbourne",
            date: calendar.date(from: DateComponents(year: 2021, month: 11, day: 20))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Rihanna's energy was infectious, filling the Rod Laver Arena with her chart-topping hits and charismatic performance.",
            isFavorite: true,
            venueLatitude: -37.8216,
            venueLongitude: 144.978
        ),
        
        Concert(
            artist: "Rihanna",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2016, month: 3, day: 27))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Rihanna's stage presence was absolutely captivating. The performance of 'Work' had the entire arena dancing along.",
            isFavorite: true,
            venueLatitude: 40.6829,
            venueLongitude: -73.9752
        ),
        
        Concert(
            artist: "Hozier",
            venue: "Red Rocks Amphitheatre",
            city: "Morrison",
            date: calendar.date(from: DateComponents(year: 2015, month: 8, day: 2))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Hozier's soulful voice echoed through Red Rocks. His performance of 'Take Me to Church' was hauntingly beautiful and left the audience in awe.",
            isFavorite: false,
            venueLatitude: 39.6654,
            venueLongitude: -105.2057
        ),
        
        Concert(
            artist: "Billie Eilish",
            venue: "Hollywood Bowl",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2021, month: 9, day: 18))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Billie Eilish mesmerized the audience with her haunting vocals and innovative sound at the iconic Hollywood Bowl.",
            isFavorite: true,
            venueLatitude: 34.1122,
            venueLongitude: -118.3391
        ),
        
        
        Concert(
            artist: "Hozier",
            venue: "The Greek Theatre",
            city: "Berkeley",
            date: calendar.date(from: DateComponents(year: 2015, month: 5, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Hozier really connected with the audience. Every soul was brough through every emotion.",
            isFavorite: false,
            venueLatitude: 37.8735,
            venueLongitude: -122.2547
        ),
        
        Concert(
            artist: "Hozier",
            venue: "Sydney Opera House",
            city: "Sydney",
            date: calendar.date(from: DateComponents(year: 2017, month: 11, day: 23))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Exciting to catch Hozier while travelling down under. I really enjoyed the aacoustic rendition of 'Take Me to Church'",
            isFavorite: true,
            venueLatitude: -33.8568,
            venueLongitude: 151.2153
        ),
        
        Concert(
            artist: "Hozier",
            venue: "Hollywood Bowl",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2015, month: 10, day: 17))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Hozier's ethereal presence and voice captivated everyone at the Hollywood Bowl. 'Cherry Wine' brought many to tears.",
            isFavorite: false,
            venueLatitude: 34.1122,
            venueLongitude: -118.3391
        ),
        


        Concert(
            artist: "Green Day",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2020, month: 7, day: 21))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "An electrifying performance by Green Day, energizing the iconic Madison Square Garden with their punk rock spirit.",
            isFavorite: true,
            venueLatitude: 40.7505,
            venueLongitude: -73.9934
        ),
        

        
        Concert(
            artist: "Green Day",
            venue: "Maracanã Stadium",
            city: "Rio de Janeiro",
            date: calendar.date(from: DateComponents(year: 2022, month: 11, day: 5))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Green Day's energetic performance reverberated through the Maracanã, leaving an indelible mark on the heart of Rio.",
            isFavorite: true,
            venueLatitude: -22.9129,
            venueLongitude: -43.2302
        ),
        




    ]
    
    // Add Sample Data to a view's ModelContext
    let concertCount = concerts.count
    
    func addSampleData(to modelContext: ModelContext) {
        for i in 0..<concertCount {
            modelContext.insert(SampleData.concerts[i])
        }
    }
}
