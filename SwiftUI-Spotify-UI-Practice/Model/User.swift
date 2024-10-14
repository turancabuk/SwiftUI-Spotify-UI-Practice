//
//  User.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 14.10.2024.
//

import Foundation

struct UserArray: Codable {
    let users: [Users]
    let total, skip, limit: Int
}

struct Users: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
}
