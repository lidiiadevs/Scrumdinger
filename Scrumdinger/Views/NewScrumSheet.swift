//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Lidiia Diachkovskaia on 12/10/25.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum //NewScrumSheet owns the source of truth for newScrum and passes a binding to DetailEditView.
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum, saveEdits: { dailyScrum in
                scrums.append(newScrum)
            })
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData))
}
