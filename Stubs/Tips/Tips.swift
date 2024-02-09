//
//  Tips.swift
//  Stubs
//
//  Created by christian on 2/8/24.
//

import Foundation
import TipKit

struct AddConcertTip: Tip {
    var title: Text {
        Text("Add your first Stub.")
    }
    
    var message: Text? {
        Text("Tap + to add a concert.")
    }
    
    var image: Image? {
        Image(systemName: "ticket")
    }
}

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
}
