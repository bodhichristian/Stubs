//
//  Extension-String.swift
//  Stubs
//
//  Created by christian on 7/13/23.
//

import Foundation

extension String {
    func english() -> String {
        self.replacingOccurrences(of: ",", with: ".")
            .replacingOccurrences(of: "vues", with: "Views")
            .replacingOccurrences(of: "de", with: "")
    }
}
