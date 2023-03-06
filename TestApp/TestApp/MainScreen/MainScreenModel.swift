//
//  MainScreenModel.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

protocol ModelProtocol {
    var networkService: NetworkServiceProtocol { get }
    var storageService: FavouriteDataStorageProtocol { get }
    
    func fetchData() async throws -> [SomeData]
    func saveFavouriteData(_ favouriteData: [FavouriteData]) throws
    func getFavouriteData() -> [FavouriteData]
}

final class MainScreenModel: ModelProtocol {
    
    let networkService: NetworkServiceProtocol
    let storageService: FavouriteDataStorageProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService(), storageService: FavouriteDataStorageProtocol = FavouriteTvShowsStorage()) {
        self.networkService = networkService
        self.storageService = storageService
    }
    
    func fetchData() async throws -> [SomeData] {
        try await networkService.fetchData()
    }
    
    func saveFavouriteData(_ favouriteData: [FavouriteData]) throws {
        try storageService.saveFavouriteData(favouriteData)
    }
    
    func getFavouriteData() -> [FavouriteData] {
        storageService.getFavouriteData()
    }
    
}
