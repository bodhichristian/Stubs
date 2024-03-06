//
//  StubCollectionWidgetLiveActivity.swift
//  StubCollectionWidget
//
//  Created by christian on 3/5/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct StubCollectionWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct StubCollectionWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StubCollectionWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension StubCollectionWidgetAttributes {
    fileprivate static var preview: StubCollectionWidgetAttributes {
        StubCollectionWidgetAttributes(name: "World")
    }
}

extension StubCollectionWidgetAttributes.ContentState {
    fileprivate static var smiley: StubCollectionWidgetAttributes.ContentState {
        StubCollectionWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: StubCollectionWidgetAttributes.ContentState {
         StubCollectionWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: StubCollectionWidgetAttributes.preview) {
   StubCollectionWidgetLiveActivity()
} contentStates: {
    StubCollectionWidgetAttributes.ContentState.smiley
    StubCollectionWidgetAttributes.ContentState.starEyes
}
