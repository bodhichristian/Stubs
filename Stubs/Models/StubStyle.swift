//
//  StubStyle.swift
//  Stubs
//
//  Created by christian on 3/21/24.
//

import Foundation
import SwiftUI

struct StubStyle {
    static let colors = [
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "indigo",
        "purple",
        "cyan",
        "mint",
        "teal",
        "brown",
        "gray"
    ]
    
    static let icons = [
        "guitars",
        "music.mic",
        "music.quarternote.3",
        "waveform",
        "hifispeaker.2",
        "music.note.list",
        "airpodsmax",
        "music.mic.circle",
        "speaker.wave.3",
        "music.note",
        "wave.3.forward"
    ]
    
    static let gradientOverlay = LinearGradient( // For stub base
        colors: [.clear, .black.opacity(0.2)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

}
