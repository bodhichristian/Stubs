//
//  ArtistDetailViewUITests.swift
//  StubsUITests
//
//  Created by christian on 4/22/24.
//

import XCTest

final class ArtistDetailViewUITests: XCTestCase {
    var app: XCUIApplication!
    var screen: ArtistDetailViewScreen!
    var entryPoint: XCUIElement!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = true
        
        
        screen = ArtistDetailViewScreen(app: app)
        entryPoint = app.scrollViews.images.firstMatch
        entryPoint.tap()
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    func testEditingNotesUpdatesNotesValue() {
        let newNotes = "The concert was incredible"

        screen.editNotesButton.tap()
        
        app.typeText(newNotes)
        screen.doneEditingButton.tap()
        
        XCTAssert(app.textViews[newNotes].exists)
    }
}
