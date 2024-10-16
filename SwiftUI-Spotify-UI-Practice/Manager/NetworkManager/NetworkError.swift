//
//  NetworkError.swift
//  SwiftUI-Spotify-UI-Practice
//
//  Created by Turan Çabuk on 16.10.2024.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
    case unknownError
}
