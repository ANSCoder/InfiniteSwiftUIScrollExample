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

extension Photo: Equatable {
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }
}

// MARK: - Media
struct Media: Codable {
    let m: String
}
