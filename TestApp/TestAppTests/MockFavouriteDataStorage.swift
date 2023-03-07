//
//  MockFavouriteDataStorage.swift
//  TestAppTests
//
//  Created by Mykyta Khlamov on 07.03.2023.
//

import Foundation
@testable import TestApp

final class MockFavouriteDataStorage: FavouriteDataStorageProtocol {
    
    let savePath: URL = FileManager.documentsDirectory.appendingPathComponent("SavedTestedFavouriteData")
    
    func saveFavouriteData(_ favouriteData: [FavouriteData]) throws {
        let data = try JSONEncoder().encode(favouriteData as? [FavouriteTvShow])
        try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
    }
    
    func getFavouriteData() -> [FavouriteData] {
        do {
            let data = try Data(contentsOf: savePath)
            return try JSONDecoder().decode([FavouriteTvShow].self, from: data)
        } catch {
            return []
        }
    }
    
}
