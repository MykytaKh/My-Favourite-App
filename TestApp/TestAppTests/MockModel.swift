//
//  MockModel.swift
//  TestAppTests
//
//  Created by Mykyta Khlamov on 07.03.2023.
//

import Foundation
@testable import TestApp

final class MockModel: ModelProtocol {
    
    let networkService: NetworkServiceProtocol = MockNetworkService()
    let storageService: FavouriteDataStorageProtocol = MockFavouriteDataStorage()
    
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
