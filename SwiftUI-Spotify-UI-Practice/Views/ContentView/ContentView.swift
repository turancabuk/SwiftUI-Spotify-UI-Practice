//
//  ContentView.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 14.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewmodel = ContentViewModel()
    
    var body: some View {
        ZStack {
            if viewmodel.isLoading {
                LoadingView()
            }else {
                ScrollView {
                    VStack(spacing: 6) {
                        ForEach(viewmodel.users) { users in
                            HStack {
                                Text(users.email)
                                    .foregroundColor(.black)                    }
                        }
                    }
                    .navigationBarTitle("Products")
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await viewmodel.fetchProducts()
            await viewmodel.fetchUsers()
        }
    }
}

#Preview {
    ContentView()
}
