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
