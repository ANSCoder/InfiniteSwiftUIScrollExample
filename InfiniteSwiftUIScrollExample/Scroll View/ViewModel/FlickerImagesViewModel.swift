//
//  FlickerImagesViewModel.swift
//  InfiniteSwiftUIScrollExample
//
//  Created by Anand Nimje on 19/06/22.
//

import Foundation
import Combine

class FlickerImagesViewModel: ObservableObject {
    @Published var loadedData: [Photo] = []
    @Published var isLoadingData = false
    private var cancellableSet: Set<AnyCancellable> = []
    var endpoint: RemoteData.Endpoint?
    
    init() { }
    
    func fetchImageData() {
        guard let endpoint = endpoint,
              !isLoadingData else {
            return
        }
        
        isLoadingData = true
        
        let url = URL.for(endpoint)
        let dataLoader = DataLoader()
        dataLoader.fetchData(for: url)
            .delay(for: 0.5, scheduler: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: {
                self.isLoadingData = false
                self.loadedData.append(contentsOf: $0.items)
            })
            .store(in: &cancellableSet)
    }
}
