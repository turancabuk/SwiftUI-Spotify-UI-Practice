//
//  ImageTitleRowCell.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 17.10.2024.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var imageName       : String  = Constant.randomImage
    var subtitle        : String  = "subtitle"
    var size            : CGFloat = 100
    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(urlString: imageName)
                .cornerRadius(4)
                .frame(width: size, height: size)
            Text(subtitle)
                .font(.title3)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .minimumScaleFactor(0.9)
                .padding(.leading, 14)
        }
        .frame(width: size)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ImageTitleRowCell()
    }
}
