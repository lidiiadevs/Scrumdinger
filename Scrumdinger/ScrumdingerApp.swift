//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Lidiia Diachkovskaia on 11/19/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
