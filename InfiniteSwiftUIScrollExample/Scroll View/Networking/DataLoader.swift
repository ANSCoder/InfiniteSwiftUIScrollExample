//
//  DataLoader.swift
//  InfiniteSwiftUIScrollExample
//
//  Created by Anand Nimje on 19/06/22.
//

import Foundation
import Combine

struct DataLoader {
    var urlSession = URLSession.shared
    
    func fetchData(for url: URL) -> AnyPublisher<Photos, Error> {
        urlSession.publisher(for: url)
    }
}

struct NetworkResponse<Wrapped: Decodable>: Decodable {
    var result: Wrapped
}

extension URLSession {
    func publisher<T: Decodable>(
        for url: URL,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, Error> {
        dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
