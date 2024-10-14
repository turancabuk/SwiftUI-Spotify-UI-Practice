//
//  ContentViewModel.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 14.10.2024.
//

import Foundation

class ContentViewModel: ObservableObject {
 
    @Published var products  : [Products] = []
    @Published var users     : [Users]    = []
    @Published var isLoading : Bool = false
    
    @MainActor
    func fetchProducts() async  {
        showLoadingView()
        do{
            products = try await NetworkManager().getProducts()
            hideLoadingView()
        }catch{
            hideLoadingView()
        }
    }
    
    @MainActor
    func fetchUsers() async {
        showLoadingView()
        do{
            users = try await NetworkManager().getUsers()
            hideLoadingView()
        }catch{
            hideLoadingView()
        }
    }
    
    private func showLoadingView() {isLoading = true}
    private func hideLoadingView() {isLoading = false}
}
