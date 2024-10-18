//
//  PlaylistHeaderCell.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 17.10.2024.
//

import SwiftUI

struct PlaylistHeaderCell: View {
    
    var imageName      : String   = Constant.randomImage
    var title          : String   = "Title"
    var subtitle       : String   = "Subtitle"
    var stretchyHeight : CGFloat  = 300
    
    var body: some View {
        ImageLoaderView(urlString: imageName)
            .overlay (
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(LinearGradient(colors: [.spotifyBlack.opacity(0), .spotifyBlack.opacity(0.8)], startPoint: .top, endPoint: .bottom))
                ,alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: stretchyHeight)
    }
}

#Preview {
    ScrollView {
        PlaylistHeaderCell()
    }
}
