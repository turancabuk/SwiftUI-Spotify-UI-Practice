//
//  MainView.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 14.10.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewmodel  = MainViewModel()
    
    var body: some View {
        ZStack {
            if viewmodel.isLoading {
                LoadingView()
            }else {
                ZStack {
                    Color.spotifyBlack.ignoresSafeArea()
                    ScrollView(.vertical) {
                        LazyVStack(spacing: 4, pinnedViews: [.sectionHeaders]) {
                            Section {
                                ForEach(0..<12) { _ in
                                    Rectangle()
                                        .frame(width: 120, height: 120)
                                        .foregroundStyle(.spotifyWhite)
                                }
                            } header: {
                                HeaderView(viewmodel: viewmodel)
                            }
                        }
                        .padding(.top, 8)
                    }
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
                            MainViewCategoryCell(title: category.rawValue, isSelected: category == selectedCategory)
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
