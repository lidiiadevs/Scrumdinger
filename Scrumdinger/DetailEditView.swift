//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Lidiia Diachkovskaia on 11/25/25.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    @State private var attendeeName = ""
    
    var body: some View {
        Form{
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title) //TextField uses $scrum.title so that whatever you type goes straight into scrum.title automatically.
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30) {
                        Text("Length") //for VoiceOver
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: attendeeName)
                            scrum.attendees.append(attendee)
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(attendeeName.isEmpty) //this modifier prevents users from mistakenly saving an attendee without a name. The button activates when the user starts typing a name in the text field.
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
