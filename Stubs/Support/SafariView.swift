//
//  SafariView.swift
//  Stubs
//
//  Created by christian on 7/13/23.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    // MARK: UIViewControllerRepresentable Conformance
    // Creates and configures the Safari view controller with the given URL.
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    // Updates the Safari view controller (if needed) when changes occur in the view.
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // No implementation needed in this case as the Safari view controller does not require any updates.
    }
}

