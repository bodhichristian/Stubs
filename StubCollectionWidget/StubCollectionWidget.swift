//
//  StubCollectionWidget.swift
//  StubCollectionWidget
//
//  Created by christian on 3/5/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct StubCollectionWidgetEntryView : View {
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
                .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white.gradient)
                .padding(.horizontal, 10)
                
                VStack {
                    Text("34")
                        .font(.system(size: 72))
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .fontDesign(.monospaced)
                    
                    Text("Concerts")
                }
                
            }
            
            .padding(.vertical)
        }

    }
}

struct StubCollectionWidget: Widget {
    let kind: String = "StubCollectionWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: ConfigurationAppIntent.self,
            provider: Provider()
        ) { entry in
            StubCollectionWidgetEntryView(entry: entry)
                .containerBackground(.black.gradient, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    StubCollectionWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
