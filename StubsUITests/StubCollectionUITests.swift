//
//  StubsUITests.swift
//  StubsUITests
//
//  Created by christian on 4/10/24.
//

import XCTest

final class StubCollectionUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testAddConcertButtonPresentsStubEditor() throws {
        let stubsNavigationBar = app.navigationBars["Stubs"]
        let addConcertButton = stubsNavigationBar/*@START_MENU_TOKEN@*/.staticTexts["Add Concert"]/*[[".otherElements[\"Add Concert\"]",".buttons[\"Add Concert\"].staticTexts[\"Add Concert\"]",".staticTexts[\"Add Concert\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        
        addConcertButton.tap()
                
        XCTAssertTrue(app.staticTexts["Stub Editor"].exists)
    }
    
    func testStubEditorCancelButtonDismissesStubEditor() throws {
        let stubsNavigationBar = app.navigationBars["Stubs"]
        let addConcertButton = stubsNavigationBar/*@START_MENU_TOKEN@*/.staticTexts["Add Concert"]/*[[".otherElements[\"Add Concert\"]",".buttons[\"Add Concert\"].staticTexts[\"Add Concert\"]",".staticTexts[\"Add Concert\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        addConcertButton.tap()
        
        let cancelButton = app.navigationBars["Stub Editor"]/*@START_MENU_TOKEN@*/.buttons["Cancel"]/*[[".otherElements[\"Cancel\"].buttons[\"Cancel\"]",".buttons[\"Cancel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cancelButton.tap()
                
        XCTAssertFalse(app.staticTexts["Stub Editor"].exists)
    }
    
    func testSearchFieldFocusCancellable() {
        let stubsNavigationBar = app.navigationBars["Stubs"]
        let cancelButton = stubsNavigationBar.buttons["Cancel"]
        let searchConcertsSearchField = stubsNavigationBar.searchFields["Search Concerts"]
        
        XCTAssertFalse(cancelButton.exists)
        
        searchConcertsSearchField.tap()
        XCTAssertTrue(cancelButton.exists)
        
        cancelButton.tap()
        XCTAssertFalse(cancelButton.exists)
    }
}











