//
//  SaveErrorAlert.swift
//  Stubs
//
//  Created by christian on 1/4/24.
//

import Foundation
import SwiftUI

struct Alerts {
    static let saveConcertError = Alert(
        title: Text("Unable to save"),
        message: Text("There was an error saving your concert"),
        dismissButton: .default(Text("OK"))
    )
}
