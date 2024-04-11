//
//  StubEditorUITests.swift
//  StubsUITests
//
//  Created by christian on 4/10/24.
//

import XCTest

final class StubEditorUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
        
        tapAddConcertButton()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testSaveButtonDisabledByDefault() {
        let stubEditorNavBar = app.navigationBars["Stub Editor"]
        let saveButton = stubEditorNavBar.buttons["Save"]
                
        XCTAssertFalse(saveButton.isEnabled)
    }
    
    func testSaveButtonEnabledWhenSaveReady() {
        let stubEditorNavBar = app.navigationBars["Stub Editor"]
        let saveButton = stubEditorNavBar.buttons["Save"]

        let collectionViewsQuery = app.collectionViews
        let artistTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Artist"]/*[[".cells.textFields[\"Artist\"]",".textFields[\"Artist\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let venueTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Venue"]/*[[".cells.textFields[\"Venue\"]",".textFields[\"Venue\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let cityTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["City"]/*[[".cells.textFields[\"City\"]",".textFields[\"City\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

        let aKey = app.keys["A"]
                
        artistTextField.tap()
        aKey.tap()
        
        venueTextField.tap()
        aKey.tap()
        
        cityTextField.tap()
        aKey.tap()

        XCTAssert(saveButton.isEnabled)
    }
    
    func testCancelButtonDismissesStubEditor() throws {
        let cancelButton = app.navigationBars["Stub Editor"]/*@START_MENU_TOKEN@*/.buttons["Cancel"]/*[[".otherElements[\"Cancel\"].buttons[\"Cancel\"]",".buttons[\"Cancel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cancelButton.tap()
        
        XCTAssertFalse(app.staticTexts["Stub Editor"].exists)
    }
}

// MARK: Navigation Methods
extension StubEditorUITests {
    func tapAddConcertButton() {
        let stubCollectionNavBar = app.navigationBars["Stubs"]
        let addConcertButton = stubCollectionNavBar.staticTexts["AddConcertButton"]
        addConcertButton.tap()
    }
}
