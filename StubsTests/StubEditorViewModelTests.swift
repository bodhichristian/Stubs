//
//  StubEditorViewModelTests.swift
//  StubsTests
//
//  Created by christian on 3/22/24.
//

import XCTest
import SwiftData
@testable import Stubs

final class StubEditorViewModelTests: XCTestCase {
    
    var modelContainer: ModelContainer!
    var modelContext: ModelContext!
    
    override func setUp() {
        super.setUp()
        
        do {
            modelContainer = try ModelContainer(for: Concert.self, Artist.self)
        } catch {
            fatalError("Failed to create ModelContainer.")
        }
        
        modelContext = ModelContext(modelContainer)
    }

    override func tearDown() {
        modelContext = nil
        super.tearDown()
    }
    
    func testStubEditorViewModelInit() {
        let expectedArtists: [Artist] = []
        let expectedConcerts: [Concert] = []
        
        let viewModel = StubEditor.ViewModel(modelContext: modelContext)
        
        XCTAssertEqual(viewModel.artists, expectedArtists)
        XCTAssertEqual(viewModel.concerts, expectedConcerts)
    }
}








