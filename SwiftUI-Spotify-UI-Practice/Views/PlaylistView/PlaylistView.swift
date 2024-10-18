//
//  PlaylistView.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 17.10.2024.
//

import SwiftUI

struct PlaylistView: View {
    
    @StateObject private var viewmodel = MainViewModel()
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 14) {
                if let product = viewmodel.products.randomElement() {
                    PlaylistHeaderCell(imageName: product.thumbnail, title: product.brand ?? "", subtitle: product.title, stretchyHeight: 340)
                    if let user = viewmodel.users.randomElement() {
                        PlaylistDescriptionCell(
                            description: product.description,
                            category: product.category ?? "",
                            userName: user.username)
                    }
                }
                ScrollView {
                    ForEach(viewmodel.products) { product in
                        HStack(alignment: .center) {
                            ImageLoaderView(urlString: product.thumbnail)
                                .frame(maxWidth: 70,maxHeight: 80)
                            VStack(alignment: .leading, spacing: 6) {
                                Text(product.title)
                                    .foregroundStyle(.spotifyWhite)
                                    .font(.headline)
                                Text(product.description)
                                    .foregroundStyle(.spotifyGray)
                                    .font(.footnote)
                                    .lineLimit(3)
                            }
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.spotifyWhite)
                        }
                        .frame(height: 65)
                        .padding(.vertical, -12)
                        .padding()
                    }
                }
                .padding(.bottom, 28)
            }
        }
        .task {
            await viewmodel.fetchProducts()
            await viewmodel.fetchUsers()
        }
    }
}

#Preview {
    
    let viewmodel = MainViewModel()
    ZStack {
        if viewmodel.isLoading {
            LoadingView()
        }else{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView {
                PlaylistView()
            }
        }
    }
    .ignoresSafeArea()
}
