//
//  FlickerImagesView.swift
//  InfiniteSwiftUIScrollExample
//
//  Created by Anand Nimje on 19/06/22.
//

import SwiftUI

struct FlickerImagesView: View {
    @RemoteData(endpoint: .feed) var feed: [Photo]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 3) {
                        ForEach(feed) { item in
                            VStack {
                                AsyncImage(url: URL(string: item.media.m)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geo.size.width/3, height: geo.size.width/3)
                            }.onAppear {
                                _feed.update()
                            }
                        }
                    }
                    if _feed.dataLoader.isLoadingData {
                        Spacer()
                        ProgressView()
                    }
                }
            }
            .navigationTitle("Photos")
        }
    }
}

struct FlickerImgesView_Previews: PreviewProvider {
    static var previews: some View {
        FlickerImagesView()
    }
}
