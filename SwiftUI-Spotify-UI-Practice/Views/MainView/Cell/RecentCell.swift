//
//  RecentCell.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 15.10.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecentCell: View {
                         
    var imageName: String = Constant.randomImage
    var title    : String = "Some random name"
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .cornerRadius(6)
    }
}

#Preview {
    RecentCell()
}
