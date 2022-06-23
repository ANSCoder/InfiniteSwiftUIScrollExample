//
//  URLSession.swift
//  InfiniteSwiftUIScrollExample
//
//  Created by Anand Nimje on 23/06/22.
//

import Foundation
import Combine

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
