//
//  AlbumSearchService.swift
//  Stubs
//
//  Created by christian on 12/11/23.
//

import Foundation

@Observable class AlbumService {
    
    var albums: [Album] = []
    
//    struct AlbumSearchResponse: Codable {
//        let album: [Album]
//    }
//
//    struct Album: Codable {
//        let idAlbum: String?
//        let idArtist: String?
//        let idLabel: String?
//        let intLoved: String?
//        let intSales: String?
//        let intScore: String?
//        let intScoreVotes: String?
//        let intYearReleased: String?
//        let strAlbum: String?
//        let strAlbum3DCase: String?
//        let strAlbum3DFace: String?
//        let strAlbum3DFlat: String?
//        let strAlbumCDart: String?
//        let strAlbumSpine: String?
//        let strAlbumStripped: String?
//        let strAlbumThumb: String?
//        let strAlbumThumbBack: String?
//        let strAlbumThumbHQ: String?
//        let strAllMusicID: String?
//        let strAmazonID: String?
//        let strArtist: String?
//        let strArtistStripped: String?
//        let strBBCReviewID: String?
//        let strDescriptionCN: String?
//        let strDescriptionDE: String?
//        let strDescriptionEN: String?
//        let strDescriptionES: String?
//        let strDescriptionFR: String?
//        let strDescriptionHU: String?
//        let strDescriptionIL: String?
//        let strDescriptionIT: String?
//        let strDescriptionJP: String?
//        let strDescriptionNL: String?
//        let strDescriptionNO: String?
//        let strDescriptionPL: String?
//        let strDescriptionPT: String?
//        let strDescriptionRU: String?
//        let strDescriptionSE: String?
//        let strDiscogsID: String?
//        let strGeniusID: String?
//        let strGenre: String?
//        let strItunesID: String?
//        let strLabel: String?
//        let strLocation: String?
//        let strLocked: String?
//        let strLyricWikiID: String?
//        let strMood: String?
//        let strMusicBrainzArtistID: String?
//        let strMusicBrainzID: String?
//        let strMusicMozID: String?
//        let strRateYourMusicID: String?
//        let strReleaseFormat: String?
//        let strReview: String?
//        let strSpeed: String?
//        let strStyle: String?
//        let strTheme: String?
//        let strWikidataID: String?
//        let strWikipediaID: String?
//    }

    func searchAlbums(for artistID: String) {
        let headers = [
            "X-RapidAPI-Key": rapidAPIKey,
            "X-RapidAPI-Host": "theaudiodb.p.rapidapi.com"
        ]

        let urlString = "https://theaudiodb.p.rapidapi.com/album.php?i=\(artistID)"
        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                print(error)
                return
            }

            guard let data = data else { return }
            
            do {
                
                let albumSearchResponse = try JSONDecoder().decode(AlbumSearchResponse.self, from: data)
                    self?.albums = albumSearchResponse.album
                print(albumSearchResponse.album)
            } catch {
                print(error)
            }
        }

        dataTask.resume()
    }
    
    // MARK: - Sample JSON Response
    /*
     
     idAlbum:"2112973"
     idArtist:"111492"
     idLabel:"43473"
     intLoved:"4"
     intSales:"0"
     intScore:"9"
     intScoreVotes:"6"
     intYearReleased:"1997"
     strAlbum:"Homework"
     strAlbum3DCase:"https://www.theaudiodb.com/images/media/album/3dcase/rxxvsu1537089989.png"
     strAlbum3DFace:"https://www.theaudiodb.com/images/media/album/3dface/uruwtw1537089982.png"
     strAlbum3DFlat:"https://www.theaudiodb.com/images/media/album/3dflat/vvyxpu1537089954.png"
     strAlbum3DThumb:null
     strAlbumCDart:"https://www.theaudiodb.com/images/media/album/cdart/homework-4dfd99b8c5213.png"
     strAlbumSpine:"https://www.theaudiodb.com/images/media/album/spine/vxxrvr1537090024.jpg"
     strAlbumStripped:"Homework"
     strAlbumThumb:"https://www.theaudiodb.com/images/media/album/thumb/homework-4dfd9a08a45d8.jpg"
     strAlbumThumbBack:"https://www.theaudiodb.com/images/media/album/thumbback/xytxss1537090052.jpg"
     strAlbumThumbHQ:null
     strAllMusicID:"mw0000097581"
     strAmazonID:null
     strArtist:"Daft Punk"
     strArtistStripped:"Daft Punk"
     strBBCReviewID:"vmq4"
     strDescriptionCN:null
     strDescriptionDE:null
     strDescriptionEN:"Homework is the debut studio album released by French electronic music duo Daft Punk in January 20, 1997. Considered a blend of house, techno, acid, funk and occasionally hip-hop, its success brought worldwide attention to French progressive house music and incited interest in French touch music, as several touch artists gained influence from Homework's style. According to The Village Voice, the album revived house music and broke free from the "Euro[dance] formula". Critically and commercially acclaimed, Homework has sold over two million copies worldwide and received several gold and platinum certifications. The album featured singles that had significant impact in the French house and global dance music scenes. This includes the critically acclaimed and commercially successful "Around the World" and "Da Funk", which have been named among the best songs of their time. The duo commented they had produced the series of tracks without an initial plan to release an album. As Thomas Bangalter stated, "It was supposed to be just a load of singles. But we did so many tracks over a period of five months that we realized that we had a good album." The album is included in the book 1001 Albums You Must Hear Before You Die."
     strDescriptionES:"Homework (Tarea en español) es el primer álbum de estudio del dúo electrónico francés Daft Punk. Fue lanzado el 20 de enero de 1997. El álbum es considerado una combinación de house, techno, acid y funk. Su estilo está marcado por un fuerte interés en plasmar el toque francés junto a varios artistas. Homework incluye los sencillo exitosos «Around the World» y «Da Funk». Daft Punk consideró que la mayoría de prensado debe ser en vinilo, así que sólo se imprimieron 50 mil álbumes inicialmente en CD. En su lanzamiento en 1997, abrumadoras ventas de Homework causaron que los distribuidores aceleren la producción y satisfacer la demanda. El álbum apareció en 35 países a través del mundo y vendió dos millones de copias en pocos meses de su lanzamiento. Homework incluye sencillos que han significado un impacto en el French house y las escenas de la música dance en el mundo.15 Este incluye el aclamado «Da Funk» y «Around the World», que alcanzaron el número uno en las listas de Billboard en la categoría Hot Dance Music/Club Play. El álbum mismo alcanzó el puesto número 150 en los Billboard 200. Como resultado de ventas, Homework fue certificado oro por el RIAA el 11 de julio de 2011. El álbum es destacado en el libro 1001 álbumes que debes oír antes de morir. En el texto, el crítico Alex Rayner declará que «Homework sirvió como un puente entre los estilos club bien establecidos y el floreciente eclecticismo de big beat. Y esto proporcionó a muchos seguidores de la música club que ahí estuvo más música dance que píldoras y patrones de teclado». Un sample de la canción «Daftendirekt» es incluido en «So Much Betta» de Janet Jackson de su álbum Discipline."
     strDescriptionFR:"Homework est le titre du premier album du groupe Daft Punk. Il est sorti en 1997, comporte 16 titres et remporta un grand succès à l'époque. Cinq singles ont été extraits : Da Funk, Around the World, Burnin', Revolution 909 et Alive sous le nom de The New Wave. 2 millions d'exemplaires furent vendus dans 35 pays différents en l'espace de 2 mois."
     strDescriptionHU:null
     strDescriptionIL:null
     strDescriptionIT:null
     strDescriptionJP:null
     strDescriptionNL:null
     strDescriptionNO:null
     strDescriptionPL:null
     strDescriptionPT:"Homework (dever de casa, em inglês) é o álbum de estréia da dupla francesa de música eletrônica Daft Punk, primeiramente lançado em 20 de janeiro de 1997. O álbum é considerado uma mistura de house, techno, acid e funk. Este é notado por induzir o interesse ao toque musical francês com diversos artistas seguindo o estilo. Homework destaca-se com os singles "Around the World" e "Da Funk". Daft Punk achava que a maioria das cópias deveriam ser em vinil, portanto, apenas 50.000 álbuns foram inicialmente gravados em CD. Após seu lançamento em 1997, as vendas impressionantes de Homework fez com que os distribuidores acelerassem a produção para satisfazer a procura. O álbum apareceu em 35 países em todo o mundo e vendeu mais de dois milhões de cópias em poucos meses de lançamento. Homework caracterizou singles que tiveram impacto significativo na French house e em cenas da dance music mundial. Isto inclui os aclamados "Da Funk" e "Around the World", que alcançou a 1ª posição nas paradas musicais da Billboard de Hot Dance Music/Club Play. Como resultado das vendas, Homework foi certificado em Ouro pela RIAA, em 11 de julho de 2001. O álbum está presente no livro 1001 Albums You Must Hear Before You Die. Nele, o crítico Alex Rayner afirma que "Homework serviu como uma ponte entre os mais estabelecidos estilos de eletrônica e o crescente ecletismo de big beat. E ele provou a muitos seguidores do clube que não havia mais música para dançar do que pílulas e predefinições de teclado". Um sample da canção "Daftendirekt" é destaque em "So Much Betta" de Janet Jackson de seu álbum Discipline."
     strDescriptionRU:null
     strDescriptionSE:null
     strDiscogsID:"26629"
     strGeniusID:null
     strGenre:"House"
     strItunesID:null
     strLabel:"Columbia"
     strLocation:null
     strLocked:"unlocked"
     strLyricWikiID:null
     strMood:"Happy"
     strMusicBrainzArtistID:"056e4f3e-d505-4dad-8ec1-d04f521cbb56"
     strMusicBrainzID:"00054665-89fa-33d5-a8f0-1728ea8c32c3"
     strMusicMozID:"Homework"
     strRateYourMusicID:"homework"
     strReleaseFormat:"Album"
     strReview:"Even before they pulled a Kraftwerk and turned into robots, Daft Punk’s talent for mythmaking was as precocious as their production skills. They first passed a cassette of their music to Stuart MacMillan, co-founder of the Scottish techno label Soma, at a Euro Disney rave in 1993. Then, following the release of just two singles, Parisians Guy-Manuel de Homem-Christo and Thomas Bangalter were snapped up by Virgin and set to work on their debut album. When Homework arrived in 1997, Britpop’s wane was too incipient to be detected and dance albums tended only to cross over into the UK’s guitar-centric mainstream if, as Leftfield, The Chemical Brothers and Underworld had shown, vocals were included to leaven all those repetitive beats. Perhaps it has something to do with Homework’s success, then, that one of its few vocal tracks happened to be Around the World, one of the decade’s catchiest singles. The track is a perfect example of Daft Punk’s sound at its most accessible: a post-disco boogie bassline, a minimalist sprinkling of synthetic keyboard melody and a single, naggingly insistent hook. While the vocal performs that role on Around the World, elsewhere the same effect is achieved using a wide variety of sounds: Da Funk’s acidic wah-wah guitar line; the torturous squeal that powers the aural battery of Rollin’ & Scratchin’; a sustained fragment of guitar distortion carrying on the ocean breeze of Fresh; the woozy oscillations and slicing percussion of Indo Silver Club. Just as distinctive as the less-is-more approach to each track’s elements is Homework’s love of compression, a sonic tribute to the FM radio stations that fed Daft Punk’s youthful obsessions. Such extreme use of attack and release, augmented still more by a predilection for filtered basslines and astringent hi-hats, establishes a distinctive tension between bass and treble that’s become as key to their sonic palette as their referencing of 70s disco, 80s pop and 90s techno. Homework could have been a superb 40-minute album, but at almost twice that length there are definite longueurs. For every bagatelle like High Fidelity or PhÅ“nix, though, there’s a gleaming techno machine like Alive ready to hover into view and throw you forward into an LED-coated future of Kanye samples, Grammys, Tron soundtracks, movies and pyramids. The rise of the robots started here."
     strSpeed:""
     strStyle:"Electronic"
     strTheme:null
     strWikidataID:"Q920504"
     strWikipediaID:"Homework_(Daft_Punk_album)"
     
     */
}
