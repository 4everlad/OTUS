//
//  OTUSWidget.swift
//  OTUSWidget
//
//  Created by Dmitry Bakulin on 09.10.2022.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct OTUSWidgetEntryView : View {
    var entry: Provider.Entry
    
    let newsTabUrl = URL(string: "widget://NewsTab")
    let profileTabUrl = URL(string: "widget://ProfileTab")

    var body: some View {
//        Link(destination: newsTabUrl!) {
//            Text("News Tab")
//        }
        Text("News")
            .widgetURL(newsTabUrl)
        
        Text("Profile")
            .widgetURL(profileTabUrl)
        
//        Spacer()
//
//        Link(destination: profileTabUrl!) {
//            Text("Profile Tab")
//        }
    }
}

@main
struct OTUSWidget: Widget {
    let kind: String = "OTUSWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            OTUSWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct OTUSWidget_Previews: PreviewProvider {
    static var previews: some View {
        OTUSWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
