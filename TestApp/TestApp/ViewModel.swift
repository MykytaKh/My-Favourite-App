//
//  ViewModel.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

class ViewModel {
    
    private var model: Model
    
    init() {
        let url = "https://api.tvmaze.com/shows"
        self.model = Model(networkService: NetworkService(urlString: url))
    }
    
    func loadButtonTapped() {
        Task {
            try await fetchData()
        }
    }
    
    func fetchData() async throws -> [FavouriteData] {
        try await model.networkService.fetchData().map { data in
            FavouriteData(id: data.id, name: data.name, summary: data.summary)
        }
    }
    
}
