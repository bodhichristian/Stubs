//
//  StubCollectionScreen.swift
//  StubsUITests
//
//  Created by christian on 4/17/24.
//

import Foundation
import XCTest

class StubCollectionScreen {
    let app: XCUIApplication
    let navBar: XCUIElement
    let addConcertButton: XCUIElement
    let searchBar: XCUIElement
    let stubEditorCancelButton: XCUIElement
    let stubEditorSaveButton: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        self.navBar = app.navigationBars["Stubs"]
        self.addConcertButton = navBar.buttons["Add Concert"]
        self.searchBar = navBar.searchFields["Search Concerts"]
        
        let stubEditorNavBar = app.navigationBars["Stub Editor"]
        self.stubEditorCancelButton = stubEditorNavBar.buttons["Cancel"]
        self.stubEditorSaveButton = stubEditorNavBar.buttons["Save"]
    }
}
