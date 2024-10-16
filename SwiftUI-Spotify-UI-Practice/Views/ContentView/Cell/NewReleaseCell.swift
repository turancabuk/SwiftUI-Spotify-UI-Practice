//
//  NewReleaseCell.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 15.10.2024.
//

import SwiftUI

struct NewReleaseCell: View {
    
    var imageName     : String  = Constant.randomImage
    var headLine      : String? = "Headline"
    var title         : String? = "Title"
    var subHeadline   : String? = "Subheadline"
    var subTitle      : String? = "Subtitle"
    var addToPlaylist : (() -> Void)? = nil
    var onPlayPress   : (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HeaderCellView(imageName: imageName, headLine: headLine, title: title)
            SubHeaderCellView(imageName: imageName, subHeadline: subHeadline, subTitle: subTitle, addToPlaylist: addToPlaylist, onPlayPress: onPlayPress)
        }
        .padding(.horizontal)
    }
}

struct HeaderCellView: View {
    
    let imageName : String?
    let headLine  : String?
    let title     : String?
    
    var body: some View {
        HStack(spacing: 12) {
            ImageLoaderView(urlString: imageName ?? "")
                .frame(width: 50, height: 50)
                .clipShape(.circle)
            VStack(alignment: .leading, spacing: 6) {
                if let headLine {
                    Text(headLine)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
                if let title {
                    Text(title)
                        .font(.callout)
                        .foregroundStyle(.spotifyWhite)
                }
            }
            .padding(12)
        }
    }
}

struct SubHeaderCellView: View {
    
    let imageName     : String?
    let subHeadline   : String?
    let subTitle      : String?
    var addToPlaylist : (() -> Void)? = nil
    var onPlayPress   : (() -> Void)? = nil

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ImageLoaderView(urlString: imageName ?? "")
                .cornerRadius(6)
                .frame(width: 160, height: 200)
            VStack(alignment: .leading, spacing: 12) {
                if let subHeadline {
                    Text(subHeadline)
                        .font(.title3)
                        .foregroundStyle(.spotifyWhite)
                }
                if let subTitle {
                    Text(subTitle)
                        .font(.footnote)
                        .foregroundStyle(.spotifyLightGray)
                        .minimumScaleFactor(0.75)
                        .lineLimit(12)
                        .padding(.trailing, 6)
                }
                Spacer()
                HStack {
                    Image(systemName: "plus.circle")
                        .font(.title3)
                        .onTapGesture {
                            addToPlaylist?()
                        }
                    Spacer()
                    Image(systemName: "play.circle.fill")
                        .font(.title)
                }
                .foregroundStyle(.spotifyWhite)
                .padding(.trailing)
                .padding(.bottom)
            }
            .padding(.top, 12)
        }
        .frame(height: 200)
        .background(Color.spotifyDarkGray)
        .cornerRadius(12)
        .onTapGesture {
            onPlayPress?()
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        NewReleaseCell()
    }
}

