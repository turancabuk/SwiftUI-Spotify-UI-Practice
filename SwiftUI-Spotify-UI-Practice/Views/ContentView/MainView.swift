//
//  MainView.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 14.10.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainView: View {
    
    @StateObject private var viewmodel  = MainViewModel()
    @State var selectedItem : Products? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewmodel.isLoading {
                    LoadingView()
                }else {
                    ZStack {
                        Color.spotifyBlack.ignoresSafeArea()
                        ScrollView(.vertical) {
                            LazyVStack(spacing: 2, pinnedViews: [.sectionHeaders]) {
                                Section {
                                    RecentView(viewmodel: viewmodel)
                                        .padding(.vertical, 14)
                                    
                                    if let product = viewmodel.products.first {
                                        createNewRelease(product: product)
                                    }
                                    
                                    if let carts = viewmodel.carts.first {
                                        createImageTitleRowCell(carts: carts)
                                            .padding(.horizontal, 24)
                                            .padding(.top, 24)
                                    }
                                }header: {
                                    HeaderView(viewmodel: viewmodel)
                                }
                            }
                        }
                        .frame(alignment: .leading)
                        .scrollIndicators(.hidden)
                        .clipped()
                    }
                }
            }
            .task {
                await viewmodel.fetchProducts()
                await viewmodel.fetchUsers()
                await viewmodel.fetchCarts()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

extension MainView {
    
    private func createNewRelease(product: Products) -> some View {
        NewReleaseCell(
            imageName: product.thumbnail,
            headLine: product.brand,
            title: product.category,
            subHeadline: product.title,
            subTitle: product.description,
            addToPlaylist: {print("Add to playlist")},
            onPlayPress: {print("Play")})
    }
    
    private func createImageTitleRowCell(carts: Cart) -> some View {
        VStack(alignment: .leading) {
            Text(carts.products.last?.title ?? "")
                .font(.title)
                .foregroundStyle(.spotifyWhite)
            ScrollView(.horizontal) {
                HStack(alignment: .top) {
                    ForEach(viewmodel.carts) { cart in
                        ImageTitleRowCell(
                            imageName: cart.products.last?.thumbnail ?? "",
                            subtitle: cart.products.last?.title ?? "",
                            size: 140)
                    }
                }
            }
        }
    }
}
#Preview {
    MainView()
}

