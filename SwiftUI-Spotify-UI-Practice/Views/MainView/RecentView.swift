//
//  RecentView.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 17.10.2024.
//

import SwiftUI

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

#Preview {
    RecentView(viewmodel: MainViewModel())
}
