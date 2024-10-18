//
//  PlaylistDescriptionCell.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 18.10.2024.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    var description: String = "description"
    var category   : String = "category"
    var userName   : String = "userName"
    var addToPlaylistPressed : (() -> Void)? = nil
    var downloadPressed      : (() -> Void)? = nil
    var sharePressed         : (() -> Void)? = nil
    var shufflePressed       : (() -> Void)? = nil
    var playPressed          : (() -> Void)? = nil
    
    var body: some View {
        Text(description)
            .foregroundStyle(.spotifyLightGray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        HStack {
            Image(systemName: "applelogo")
                .foregroundStyle(.spotifyGreen)
                .font(.title3)
            Text("Made for")
                .foregroundStyle(.spotifyLightGray)
            Text(userName)
                .foregroundStyle(.spotifyWhite)
                .font(.headline)
        }
        .padding(.leading)
        Text(category)
            .foregroundStyle(.spotifyWhite)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.leading)
            .padding(.top, 6)
        HStack(spacing: 12) {
            Image(systemName: "plus.circle")
                .foregroundStyle(.spotifyWhite)
                .font(.title3)
                .onTapGesture {addToPlaylistPressed}
            Image(systemName: "arrow.down.circle")
                .foregroundStyle(.spotifyWhite)
                .font(.title3)
                .onTapGesture {downloadPressed}
            Image(systemName: "square.and.arrow.up")
                .foregroundStyle(.spotifyWhite)
                .font(.title3)
                .onTapGesture {sharePressed}
            Spacer()
            Image(systemName: "shuffle")
                .foregroundStyle(.spotifyGreen)
                .font(.title)
                .onTapGesture {shufflePressed}
            Image(systemName: "play.circle.fill")
                .foregroundStyle(.spotifyGreen)
                .font(.largeTitle)
                .onTapGesture {playPressed}
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .foregroundStyle(.spotifyWhite)
    }
}

#Preview {
    VStack {
        PlaylistDescriptionCell()
    }
}
