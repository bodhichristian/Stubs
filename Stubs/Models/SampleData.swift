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
    
    // Create an empty artist object for use when nil coalescing
    static let emptyArtist = Artist(idArtist: "", idLabel: "", intBornYear: "", intCharted: "", intDiedYear: "", intFormedYear: "", intMembers: "", strArtist: "", strArtistAlternate: "", strArtistBanner: "", strArtistClearart: "", strArtistFanart: "", strArtistFanart2: "", strArtistFanart3: "", strArtistLogo: "", strArtistStripped: "", strArtistThumb: "", strArtistWideThumb: "", strBiographyCN: "", strBiographyDE: "", strBiographyEN: "", strBiographyES: "", strBiographyFR: "", strBiographyHU: "", strBiographyIL: "", strBiographyIT: "", strBiographyJP: "", strBiographyNL: "", strBiographyNO: "", strBiographyPL: "", strBiographyPT: "", strBiographyRU: "", strBiographySE: "", strCountry: "", strCountryCode: "", strDisbanded: "", strFacebook: "", strGender: "", strGenre: "", strLabel: "", strLastFMChart: "", strLocked: "", strMood: "", strMusicBrainzID: "", strStyle: "", strTwitter: "", strWebsite: "")
    
    // Create a sample bio for testing ArtistDetailView without API calls
    static let sampleBio = "Sir Elton Hercules John, CBE (born Reginald Kenneth Dwight on 25 March 1947 in Pinner, Middlesex, England) is an English rock singer-songwriter, composer, pianist and occasional actor. He has worked with lyricist Bernie Taupin as his songwriter partner since 1967; they have collaborated on more than 30 albums to date.\nIn his four-decade career John has sold more than 250 million records, making him one of the most successful artists of all time. His single \"Candle in the Wind 1997\" has sold over 33 million copies worldwide, and is the best selling single in Billboard history. He has more than 50 Top 40 hits, including seven consecutive No. 1 US albums, 56 Top 40 singles, 16 Top 10, four No. 2 hits, and nine No. 1 hits. He has won six Grammy Awards, four Brit Awards, an Academy Award, a Golden Globe Award and a Tony Award. In 2004, Rolling Stone ranked him Number 49 on its list of the 100 greatest artists of all time.\nJohn was inducted into the Rock and Roll Hall of Fame in 1994. Having been named a Commander of the Order of the British Empire in 1996, John received a knighthood from Queen Elizabeth II for \"services to music and charitable services\" in 1998. John has performed at a number of royal events, such as the funeral of Princess Diana at Westminster Abbey in 1997, and the Queen\'s Diamond Jubilee Concert outside Buckingham Palace in 2012.\nHe has been heavily involved in the fight against AIDS since the late 1980s. In 1992, he established the Elton John AIDS Foundation and a year later began hosting the annual Academy Award Party, which has since become one of the most high-profile Oscar parties in the Hollywood film industry. Since its inception, the foundation has raised over $200 million.\nJohn entered into a civil partnership with David Furnish on 21 December 2005 and continues to be a champion for LGBT social movements. In 2008, Billboard magazine ranked him as the most successful male solo artist on \"The Billboard Hot 100 Top All-Time Artists\" (third overall, behind only The Beatles and Madonna)."
    
    
    static let adele = Artist(
        strArtist: "Adele",
        strArtistFanart2: "https://www.theaudiodb.com/images/media/artist/fanart/qrsrsv1340825598.jpg",
        strArtistThumb: "https://www.theaudiodb.com/images/media/artist/thumb/oq063t1639312086.jpg",
        strBiographyEN: "Adele Laurie Blue Adkins MBE (born 5 May 1988) is an English singer and songwriter. Graduating from the BRIT School for Performing Arts and Technology in 2006, Adele was given a recording contract by XL Recordings after a friend posted her demo on Myspace the same year. In 2007, she received the Brit Awards \"Critics' Choice\" award and won the BBC Sound of 2008 poll. Her debut album, 19, was released in 2008 to commercial and critical success. It is certified seven times platinum in the UK, and double platinum in the US. An appearance she made on Saturday Night Live in late 2008 boosted her career in the US. At the 51st Annual Grammy Awards in 2009, Adele received the awards for Best New Artist and Best Female Pop Vocal Performance. Adele released her second studio album, 21, in early 2011. The album was well received critically and surpassed the success of her debut, earning the singer numerous awards in 2012, including a record-tying six Grammy Awards, including Album of the Year; two Brit Awards, including British Album of the Year, and three American Music Awards. The album has been certified 16 times platinum in the UK, and is the fourth best-selling album in the UK of all time. In the US it has held the top position longer than any album since 1985, and is certified Diamond. The album has sold 31 million copies worldwide. The success of 21 earned Adele numerous mentions in the Guinness Book of World Records. She is the first woman in the history of the Billboard Hot 100 to have three simultaneous top 10 singles as a lead artist, and the first female artist to simultaneously have two albums in the top five of the Billboard 200 and two singles in the top five of the Billboard Hot 100. 21 is the longest-running number one album by a female solo artist in the history of the UK and US Album Charts. In 2012, she released \"Skyfall\", which she wrote and recorded for the James Bond film of the same name. The song won an Academy Award, a Grammy Award, and a Golden Globe Award for Best Original Song. After taking a three-year break, Adele released her third studio album, 25, on 20 November 2015. The album debuted at number one in most major markets and broke first week sales records in the UK and US. The lead single, \"Hello\", debuted at number one in many countries around the world, and became the first song in the US to sell over one million digital copies within a week of its release. In 2011 and 2012, Billboard named Adele Artist of the Year. In 2012, she was listed at number five on VH1's 100 Greatest Women in Music, and Time magazine named her one of the most influential people in the world. On 15 January 2016, her sales were estimated at more than 100 million records, making her one of the world's best-selling artists.",
        strCountry: "Tottenham, UK",
        strGenre: "Soul"
    )
    
    static let arianaGrande = Artist(
        strArtist: "Ariana Grande",
        strArtistFanart2: "https://www.theaudiodb.com/images/media/artist/fanart/grande-ariana-50a121f6de7c0.jpg",
        strArtistThumb: "https://www.theaudiodb.com/images/media/artist/thumb/yy8zqo1636559141.jpg",
        strBiographyEN: "Ariana Grande-Butera (born June 26, 1993), known professionally as Ariana Grande (/ˌɑriːˈɑːnə ˈɡrɑːndeɪ/), is an American singer and actress. She began her career in the Broadway musical 13, before landing the role of Cat Valentine on the Nickelodeon television series Victorious in 2009. After four seasons, the show ended, and Grande starred on the spinoff, Sam & Cat, which ended in 2014. She has also appeared in other theatre, television and film roles and lent her voice to animated television and films. Grande's music career began with the soundtrack Music from Victorious (2011). She signed a recording contract with Republic Records and released her debut studio album Yours Truly in 2013, which debuted at number one on the US Billboard 200. The album's lead single,\"The Way\", reached the top-ten of the Billboard Hot 100, with critics comparing her wide vocal range to Mariah Carey's. Grande's second studio album, My Everything (2014), also reached number one in the United States. With the singles \"Problem\", \"Break Free\", \"Bang Bang\" and \"Love Me Harder\" from that album, she spent 34 continuous weeks in the top 10 of the Billboard Hot 100 and had the most top 10 singles of any artist in 2014. In 2015, she promoted My Everything with her first world tour titled The Honeymoon Tour and guest-starred in Fox comedy-horror TV series Scream Queens. In 2015, Grande released the lead single \"Focus\" from her upcoming third album Moonlight, released a holiday EP album, Christmas & Chill, and she was heard on several collaborative projects. Grande's accolades include two American Music Awards, Music Business Association's Breakthrough Artist of the Year, an MTV Video Music Award, an MTV Europe Music Award and two Grammy Award nominations. Ariana Grande-Butera was born in Boca Raton, Florida, to Joan Grande, chief executive officer of telephone and alarm system company Hose-McCann Communications, and Edward Butera, who owns a graphic design firm in Boca Raton. Her name was originally inspired by Princess Oriana from Felix the Cat (1959). Grande is of Italian descent, half Sicilian and half Abruzzese. She has experienced hypoglycemia. She has an older half-brother, Frankie Grande, who is an actor, dancer, and producer. Grande's mother moved with her father from New York to Florida when she was pregnant with her. She has stated that her parents separated when she was around 8 or 9 years old. As a child, Grande performed with the Fort Lauderdale Children's Theater, playing her first role as Annie, as well as performing in the musicals The Wizard of Oz and Beauty and the Beast. At the age of 8, she performed at a karaoke lounge on a cruise ship, in various orchestras such as South Florida's Philharmonic, Florida Sunshine Pops and Symphonic Orchestras, and made her national television debut singing \"The Star-Spangled Banner\" for the Florida Panthers. She attended Pine Crest School and North Broward Preparatory School. By age 13, she became serious about pursuing a music career, though she still concentrated on theater. When she first arrived in Los Angeles to meet with her managers, she expressed a desire to record an R&B album when she was 14: \"I was like, 'I want to make an R&B album,' They were like 'Um, that's a helluva goal! Who is going to buy a 14-year-old's R&B album?!'\" In 2008, Grande was cast in the supporting role of cheerleader Charlotte in the musical 13 on Broadway, for which she won a National Youth Theatre Association Award. When she joined the musical, Grande left her high school, North Broward Preparatory School, but continued to be enrolled. The school sent materials to her so she could study with tutors. She also sang various times at the New York City Jazz club Birdland.",
        strCountry: "Boca Raton, Florida",
        strGenre: "Pop"
    )
    
    static let beyonce = Artist(
        strArtist: "Beyoncé",
        strArtistFanart2: "https://www.theaudiodb.com/images/media/artist/fanart/knowles-beyonc-508490b420589.jpg",
        strArtistThumb: "https://www.theaudiodb.com/images/media/artist/thumb/wouav91634257602.jpg",
        strBiographyEN: "Beyoncé Giselle Knowles-Carter (born September 4, 1981) is an American singer, songwriter, record producer and actress. Born and raised in Houston, Texas, she performed in various singing and dancing competitions as a child, and rose to fame in the late 1990s as lead singer of R&B girl-group Destiny's Child. Managed by her father, Mathew Knowles, the group became one of the world's best-selling girl groups of all time. Their hiatus saw the release of Beyoncé's debut album, Dangerously in Love (2003), which established her as a solo artist worldwide, earned five Grammy Awards and featured the Billboard Hot 100 number-one singles \"Crazy in Love\" and \"Baby Boy\". Following the disbandment of Destiny's Child in June 2005, she released her second solo album, B'Day (2006), which contained hits \"Déjà Vu\", \"Irreplaceable\", and \"Beautiful Liar\". Beyoncé also ventured into acting, with a Golden Globe-nominated performance in Dreamgirls (2006), and starring roles in The Pink Panther (2006) and Obsessed (2009). Her marriage to rapper Jay Z and portrayal of Etta James in Cadillac Records (2008) influenced her third album, I Am... Sasha Fierce (2008), which saw the birth of her alter-ego Sasha Fierce and earned a record-setting six Grammy Awards in 2010, including Song of the Year for \"Single Ladies (Put a Ring on It)\". Beyoncé took a hiatus from music in 2010 and took over management of her career; her fourth album 4 (2011) was subsequently mellower in tone, exploring 1970s funk, 1980s pop, and 1990s soul. Her critically acclaimed fifth studio album, Beyoncé (2013), was distinguished from previous releases by its experimental production and exploration of darker themes. With the release of Lemonade (2016), Beyoncé became the first artist to have their first six studio albums debut at number one on the Billboard 200 chart. A self-described \"modern-day feminist\", Beyoncé creates songs that are often characterized by themes of love, relationships, and monogamy, as well as female sexuality and empowerment. On stage, her dynamic, highly choreographed performances have led to critics hailing her as one of the best entertainers in contemporary popular music. Throughout a career spanning 19 years, she has sold over 118 million records as a solo artist, and a further 60 million with Destiny's Child, making her one of the best-selling music artists of all time. She has won 20 Grammy Awards and is the most nominated woman in the award's history. The Recording Industry Association of America recognized her as the Top Certified Artist in America during the 2000s decade. In 2009, Billboard named her the Top Radio Songs Artist of the Decade, the Top Female Artist of the 2000s and their Artist of the Millennium in 2011. Time listed her among the 100 most influential people in the world in 2013 and 2014. Forbes magazine also listed her as the most powerful female musician of 2015.",
        strCountry: "Houston, Texas",
        strGenre: "R&B"
    )
    
    // Create a static array of Sample Concerts
    static let concerts: [Concert] = [
        Concert(
            artistName: "Adele",
            venue: "Barclays Center",
            city: "Brooklyn",
            date: calendar.date(from: DateComponents(year: 2016, month: 11, day: 4))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Adele's voice resonated with soulful depth throughout the Barclays Center. Her humorous interactions with the audience added a lovely personal touch to the night.",
            isFavorite: false,
            venueLatitude: 40.6829,
            venueLongitude: -73.9752,
            artist: SampleData.adele
        ),
        
        Concert(
            artistName: "Adele",
            venue: "Royal Albert Hall",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2015, month: 9, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Adele's voice filled the Royal Albert Hall with warmth. Her rendition of 'Someone Like You' was emotionally powerful. A night of soulful music and heartfelt stories.",
            isFavorite: true,
            venueLatitude: 51.501,
            venueLongitude: 0.1774,
            artist: SampleData.adele
            
        ),
        
        Concert(
            artistName: "Adele",
            venue: "The SSE Hydro",
            city: "Glasgow",
            date: calendar.date(from: DateComponents(year: 2016, month: 3, day: 25))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Adele's voice was mesmerizing in Glasgow. Her banter with the audience was charming. 'Someone Like You' was a tearjerker.",
            isFavorite: false,
            venueLatitude: 55.8609,
            venueLongitude: -4.2873,
            artist: SampleData.adele
            
        ),
        
        Concert(
            artistName: "Ariana Grande",
            venue: "Staples Center",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2019, month: 5, day: 7))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ariana Grande's vocal prowess was on full display. Her performance of 'Thank U, Next' was both empowering and poignant. An inspiring concert.",
            isFavorite: false,
            venueLatitude: 34.043,
            venueLongitude: -118.2673,
            artist: SampleData.arianaGrande
            
        ),
        
        Concert(
            artistName: "Ariana Grande",
            venue: "AccorHotels Arena",
            city: "Paris",
            date: calendar.date(from: DateComponents(year: 2017, month: 8, day: 25))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ariana Grande's voice was as stunning as ever. The high notes in 'No Tears Left to Cry' gave everyone chills. A truly captivating show.",
            isFavorite: false,
            venueLatitude: 48.8388,
            venueLongitude: 2.3782,
            artist: SampleData.arianaGrande
            
        ),
        
        Concert(
            artistName: "Ariana Grande",
            venue: "The O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2019, month: 8, day: 17))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Ariana Grande's vocal range was on full display at The O2. The production was top-notch. 'Thank U, Next' was a powerful finale.",
            isFavorite: true,
            venueLatitude: 51.5033,
            venueLongitude: 0.0032,
            artist: SampleData.arianaGrande
            
        ),
        
        Concert(
            artistName: "Beyoncé",
            venue: "Madison Square Garden",
            city: "New York",
            date: calendar.date(from: DateComponents(year: 2019, month: 9, day: 22))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé ruled the stage with her incredible voice. Every song was a hit. The crowd went wild for 'Halo'.",
            isFavorite: true,
            venueLatitude: 40.7505,
            venueLongitude: -73.9934,
            artist: SampleData.beyonce
            
        ),
        
        Concert(
            artistName: "Beyoncé",
            venue: "The O2 Arena",
            city: "London",
            date: calendar.date(from: DateComponents(year: 2016, month: 7, day: 14))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé's performance was a spectacular blend of vocals and visuals. The energy during 'Formation' was incredible. A truly empowering concert experience.",
            isFavorite: true,
            venueLatitude: 51.5033,
            venueLongitude: 0.0032,
            artist: SampleData.beyonce
            
        ),
        
        Concert(
            artistName: "Beyoncé",
            venue: "SoFi Stadium",
            city: "Los Angeles",
            date: calendar.date(from: DateComponents(year: 2023, month: 6, day: 14))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé's show was a dazzling display of artistry and empowerment. Her performance was a blend of spectacular visuals, dance, and incredible vocals.",
            isFavorite: true,
            venueLatitude: 33.9534,
            venueLongitude: -118.3387,
            artist: SampleData.beyonce
            
        ),
        
        Concert(
            artistName: "Beyoncé",
            venue: "Rose Bowl",
            city: "Pasadena",
            date: calendar.date(from: DateComponents(year: 2015, month: 6, day: 28))!,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "Beyoncé's stage presence was unmatched. The choreography and vocals for 'Halo' were spectacular. Truly a queen of the stage.",
            isFavorite: true,
            venueLatitude: 34.1613,
            venueLongitude: -118.1676,
            artist: SampleData.beyonce
            
        ),
        
        
        
        
        Concert(
            artistName: "Billy Joel",
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
            artistName: "Billy Joel",
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
            artistName: "Bring Me The Horizon",
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
            artistName: "Bring Me The Horizon",
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
            artistName: "Bruno Mars",
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
            artistName: "Bruno Mars",
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
            artistName: "Bring Me The Horizon",
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
            artistName: "Bring Me The Horizon",
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
            artistName: "Green Day",
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
            artistName: "Green Day",
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
            artistName: "Green Day",
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
            artistName: "Billie Eilish",
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
            artistName: "Rihanna",
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
            artistName: "Rihanna",
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
            artistName: "Foo Fighters",
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
            artistName: "Foo Fighters",
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
            artistName: "Billie Eilish",
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
            artistName: "Foo Fighters",
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
            artistName: "Elton John",
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
            artistName: "The Rolling Stones",
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
            artistName: "Billie Eilish",
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
            artistName: "Bruno Mars",
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
            artistName: "Green Day",
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
            artistName: "Foo Fighters",
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
            artistName: "Foo Fighters",
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
            artistName: "Rihanna",
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
            artistName: "Rihanna",
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
            artistName: "Hozier",
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
            artistName: "Billie Eilish",
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
            artistName: "Hozier",
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
            artistName: "Hozier",
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
            artistName: "Hozier",
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
            artistName: "Green Day",
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
            artistName: "Green Day",
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
