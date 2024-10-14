//
//  LoadingView.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 14.10.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .opacity(0.9)
                .ignoresSafeArea()
            ProgressView()
                .tint(.orange)
                .scaleEffect(2)
                .foregroundColor(.red)
        }
    }
}

#Preview {
    LoadingView()
}
