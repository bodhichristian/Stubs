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
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = true
        
        screen = ArtistDetailViewScreen(app: app)
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    func testRunCL() {
  
        let scrollViewsQuery = app.scrollViews

        scrollViewsQuery.images.firstMatch.tap()
                
    }
}
