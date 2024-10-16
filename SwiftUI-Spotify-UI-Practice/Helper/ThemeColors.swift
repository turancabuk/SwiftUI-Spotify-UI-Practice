//
//  ThemeColors.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 15.10.2024.
//

import SwiftUI

extension View {
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
}
