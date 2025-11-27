//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Lidiia Diachkovskaia on 11/26/25.
//

import SwiftUI
import ThemeKit

struct ThemeView: View { // as a cell in a list to display all the themes
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
