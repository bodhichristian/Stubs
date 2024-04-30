//
//  XCUIApplication+ClearTextField.swift
//  StubsUITests
//
//  Created by christian on 4/16/24.
//

import Foundation
import XCTest

extension XCUIApplication {
    /// Clear a text field of any typed text.
    /// - Parameter element: Expects a Text Field element for interaction
    func clearTextOnElement(_ element: XCUIElement) {
        element.doubleTap()
        menuItems["Cut"].tap()
    }
}
