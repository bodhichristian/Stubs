//
//  ArtistViewOptionsTip.swift
//  Stubs
//
//  Created by christian on 3/11/24.
//

import Foundation
import TipKit

struct ArtistsViewOptionsTip: Tip {
    static let addArtistEvent = Event(id: "addArtistEvent")
    
    var title: Text {
        Text("Prefer a different style?")
    }
    
    var message: Text? {
        Text("Tap on View Options to explore alternatives.")
    }
    
    var image: Image? {
        Image(systemName: "line.3.horizontal.circle")
    }
    
    var options: [TipOption] {
        Tip.MaxDisplayCount(1)
    }
    
    var rules: [Rule] {
        #Rule(Self.addArtistEvent) { event in
            event.donations.count >= 3
        }
    }
}

 
