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
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
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
}

struct RecentView: View {
    
    let viewmodel: MainViewModel
    
    var body: some View {
        LazyVGrid(columns: viewmodel.columns) {
            ForEach(viewmodel.products) { product in
                RecentCell(imageName: product.images.first ?? "",
                           title: product.title)
            }
        }
        .padding(.horizontal)
    }
}

struct HeaderView: View {
    
    let viewmodel: MainViewModel
    @State private var selectedCategory : Category? = nil
    
    var body: some View {
        HStack(spacing: 0){
            if viewmodel.currentUser != nil {
                ImageLoaderView()
                    .frame(width: 35, height: 35)
                    .background(.spotifyWhite)
                    .cornerRadius(.infinity)
                    .onTapGesture {
                        
                    }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Category.allCases, id: \.self) { category in
                            CategoryCell(title: category.rawValue, isSelected: category == selectedCategory)
                                .onTapGesture {
                                    selectedCategory = category
                                }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
    }
}
#Preview {
    MainView()
}

