//
//  ArtistViewOptionsTip.swift
//  Stubs
//
//  Created by christian on 3/11/24.
//

import Foundation
import TipKit


struct ArtistsViewOptionsTip: Tip {
    var title: Text {
        Text("Change it up.")
    }
    
    var message: Text? {
        Text("Open this menu to explore sorting options.")
    }
    
    var image: Image? {
        Image(systemName: "list.bullet")
    }
    
    var options: [TipOption] {
        Tip.MaxDisplayCount(1)
    }
}

