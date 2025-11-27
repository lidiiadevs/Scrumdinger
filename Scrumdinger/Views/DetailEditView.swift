//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Lidiia Diachkovskaia on 11/25/25.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var attendeeName = ""
    
    var body: some View {
        Form{
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title) //TextField uses $scrum.title so that whatever you type goes straight into scrum.title automatically.
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30) {
                        Text("Length") //for VoiceOver
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
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
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(attendeeName.isEmpty) //this modifier prevents users from mistakenly saving an attendee without a name. The button activates when the user starts typing a name in the text field.
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0] //you can type, move sliders, toggle switches, etc., and the preview keeps the updated value while you work.
    DetailEditView(scrum: $scrum)
}
