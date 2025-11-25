//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Lidiia Diachkovskaia on 11/25/25.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    
    var body: some View {
        Form{
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
            }
        }
    }
}

#Preview {
    DetailEditView()
}
