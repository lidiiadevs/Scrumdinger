//
//  TrailingIconStyle.swift
//  Scrumdinger
//
//  Created by Lidiia Diachkovskaia on 11/22/25.
//

import SwiftUI

struct TrailingIconStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title //the configuration parameter is a LabelStyleConfiguration - contains icon and title views that represent the label's image and text
            configuration.icon
        }
        
    }
}

extension LabelStyle where Self == TrailingIconStyle {
    static var trailingIcon: Self { Self() } //Because you defined the label style as a static property, you can call it using leading-dot syntax, which makes your code more readable.
}
