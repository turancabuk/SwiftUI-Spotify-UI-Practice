//
//  Product.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 14.10.2024.
//

import Foundation

struct ProductArray: Codable {
    let products: [Products]
    let total, skip, limit: Int
}

struct Products: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let brand, category: String?
    let thumbnail: String
    let images: [String]
}
