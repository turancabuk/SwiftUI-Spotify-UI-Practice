//
//  MainViewModel.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 14.10.2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
 
    @Published var products     : [Products] = []
    @Published var users        : [Users]    = []
    @Published var isLoading    : Bool = false
    @Published var currentUser  : Users? = nil
    let columns                 = [GridItem(.flexible(minimum: 60, maximum: 200)),
                                   GridItem(.flexible(minimum: 60, maximum: 200))]
    
    @MainActor
    func fetchProducts() async  {
        showLoadingView()
        do{
            products = try await Array(NetworkManager().getProducts().prefix(8))
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
            currentUser = try await NetworkManager().getUsers().first
            hideLoadingView()
        }catch{
            hideLoadingView()
        }
    }
    
    private func showLoadingView() {isLoading = true}
    private func hideLoadingView() {isLoading = false}
}
