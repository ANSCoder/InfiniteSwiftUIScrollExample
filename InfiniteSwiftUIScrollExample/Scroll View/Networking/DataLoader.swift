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
