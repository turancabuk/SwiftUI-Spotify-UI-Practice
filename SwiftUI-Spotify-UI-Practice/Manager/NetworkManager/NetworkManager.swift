//
//  NetworkManager.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 14.10.2024.
//

import SwiftUI

struct NetworkManager {
    
    func getProducts() async throws -> [Products] {
        guard let url = URL(string: "https://dummyjson.com/products") else {throw (NetworkError.badURL)}
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let products  = try await JSONDecoder().decode(ProductArray.self, from: data)
        return  products.products
    }
    
    func getUsers() async throws -> [Users] {
        guard let url = URL(string: "https://dummyjson.com/users") else { throw (NetworkError.badURL)}
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let users     = try await JSONDecoder().decode(UserArray.self, from: data)
        return users.users
    }
}




