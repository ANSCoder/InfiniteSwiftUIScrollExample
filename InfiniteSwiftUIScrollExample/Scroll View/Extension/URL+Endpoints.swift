//
//  URL+Endpoints.swift
//  InfiniteSwiftUIScrollExample
//
//  Created by Anand Nimje on 23/06/22.
//

import Foundation

extension URL {
    static func `for`(_ endpoint: RemoteData.Endpoint) -> URL {
        return URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?nojsoncallback=1&format=json")!
    }
}
