//
//  FavouriteDataStorage.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 02.03.2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

protocol FavouriteDataStorageProtocol {
    var savePath: URL { get }
    
    func saveFavouriteData(_ favouriteData: [FavouriteData]) throws
    func getFavouriteData() -> [FavouriteData]
}

final class FavouriteTvShowsStorage: FavouriteDataStorageProtocol {
    
    let savePath: URL = FileManager.documentsDirectory.appendingPathComponent("SavedFavouriteTvShows")
    
    func saveFavouriteData(_ favouriteData: [FavouriteData]) throws {
        do {
            let data = try JSONEncoder().encode(favouriteData as? [FavouriteTvShow])
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            throw error
        }
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
