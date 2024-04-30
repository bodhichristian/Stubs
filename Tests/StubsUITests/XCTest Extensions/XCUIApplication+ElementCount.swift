//
//  XCUIApplication+ElementCount.swift
//  StubsUITests
//
//  Created by christian on 4/26/24.
//

import Foundation
import XCTest

extension XCUIApplication {
    func elementCount(for label: String) -> Int {
        return self.staticTexts.containing(NSPredicate(format: "label CONTAINS[c] %@", label)).count
    }
}
