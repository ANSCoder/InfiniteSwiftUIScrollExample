//
//  Photos.swift
//  InfiniteSwiftUIScrollExample
//
//  Created by Anand Nimje on 19/06/22.
//

import Foundation

struct Photos: Codable {
    let items: [Photo]
}

// MARK: - Item
struct Photo: Identifiable, Codable {
    let id = UUID()
    let title: String
    let media: Media
}

// MARK: - Media
struct Media: Codable {
    let m: String
}
