//
//  HeaderView.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 17.10.2024.
//

import SwiftUI

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
    HeaderView(viewmodel: MainViewModel())
}
