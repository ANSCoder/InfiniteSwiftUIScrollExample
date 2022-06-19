//
//  RemoteData.swift
//  InfiniteSwiftUIScrollExample
//
//  Created by Anand Nimje on 19/06/22.
//

import SwiftUI

@propertyWrapper
struct RemoteData: DynamicProperty {
    @StateObject var dataLoader = FlickerImagesViewModel()
    private let endpoint: Endpoint
    
    var wrappedValue: [Photo] {
        dataLoader.loadedData
    }
    
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    @Environment(\.urlSession) var urlSession
    
    func update() {
        if dataLoader.endpoint == nil {
            dataLoader.endpoint = endpoint
        }
        dataLoader.fetchImageData()
    }
}

private struct URLSessionKey: EnvironmentKey {
    static let defaultValue: URLSession = {
        URLSession.shared
    }()
}

extension EnvironmentValues {
    var urlSession: URLSession {
        get { self[URLSessionKey.self] }
        set { self[URLSessionKey.self] = newValue }
    }
}
