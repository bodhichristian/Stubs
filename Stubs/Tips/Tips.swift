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
        Text("Tap here to create a Concert Ticket Stub")
    }
    
    var image: Image? {
        Image(systemName: "ticket")
    }
}
