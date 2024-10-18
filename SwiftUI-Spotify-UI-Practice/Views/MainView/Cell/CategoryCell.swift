//
//  CategoryCell.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 15.10.2024.
//

import SwiftUI

struct CategoryCell: View {
    
    var title           : String = "Music"
    var isSelected      : Bool = false
    
    
    var body: some View {
        
        VStack {
            Text(title.capitalized)
                .font(.callout)
                .frame(minWidth: 36)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .themeColors(isSelected: isSelected)
                .cornerRadius(16)
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        HStack {
            CategoryCell(title: "deneme", isSelected: true)
            CategoryCell(title: "tecrübe", isSelected: false)
            CategoryCell(title: "hazır", isSelected: false)
            CategoryCell(title: "settings", isSelected: false)
        }
    }
}
