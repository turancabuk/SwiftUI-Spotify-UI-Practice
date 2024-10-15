//
//  MainViewCategoryCell.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 15.10.2024.
//

import SwiftUI

struct MainViewCategoryCell: View {
    
    var title           : String = "Music"
    var isSelected      : Bool = false
    
    
    var body: some View {
        
        VStack {
            Text(title.capitalized)
                .font(.callout)
                .frame(minWidth: 36)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
                .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
                .cornerRadius(16)
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        HStack {
            MainViewCategoryCell(title: "deneme", isSelected: true)
            MainViewCategoryCell(title: "tecrübe", isSelected: false)
            MainViewCategoryCell(title: "hazır", isSelected: false)
            MainViewCategoryCell(title: "settings", isSelected: false)
        }
    }
}
