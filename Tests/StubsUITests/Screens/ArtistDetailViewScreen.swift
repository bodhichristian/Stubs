//
//  ArtistDetailViewScreen.swift
//  StubsUITests
//
//  Created by christian on 4/22/24.
//

import Foundation
import XCTest

class ArtistDetailViewScreen: Screen {
    var app: XCUIApplication
    
    let favoriteButton: XCUIElement
    let editNotesButton: XCUIElement
    let doneEditingButton: XCUIElement
    let textEditor: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        self.editNotesButton = app.buttons["square.and.pencil.circle"]
        self.favoriteButton = app.buttons["Favorite"]
        self.doneEditingButton = app.buttons["DONE"]
        self.textEditor = app
    }
    
    
}
