//
//  FavoriteConcertTip.swift
//  Stubs
//
//  Created by christian on 3/11/24.
//

import Foundation
import TipKit

struct FavoriteConcertTip: Tip {
    var title: Text {
        Text("One of the best?")
    }
    
    var message: Text? {
        Text("Tap the Favorite button to toggle status.")
    }
    
    var options: [TipOption] {
        Tip.MaxDisplayCount(1)
    }
}
