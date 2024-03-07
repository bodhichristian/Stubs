//
//  StubsWidget.swift
//  StubsWidget
//
//  Created by christian on 3/7/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct StubsWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        GeometryReader { geo in
            ZStack {
                StubShape()
                    .foregroundStyle(.black.gradient.opacity(0.8))
                StubShape()
                    .foregroundStyle(.ultraThinMaterial)
                StubShape()
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .foregroundStyle(.white.gradient)
                
                HStack {
                    VerticalLineBoundary()
                    Spacer()
                    VerticalLineBoundary()
                }
                .foregroundStyle(.white.gradient)
                .padding(.horizontal, 10)
                
                VStack {
                    Text("34")
                        .font(.system(size: 72))
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .fontDesign(.monospaced)
                }
            }
            .position(
                CGPoint(
                    x: geo.size.width / 2,
                    y: geo.size.height / 2
                )
            )
            .frame(
                maxWidth: 200,
                maxHeight: 100
            )
        }
    }
}

struct StubsWidget: Widget {
    let kind: String = "StubsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                StubsWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                StubsWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    StubsWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
