//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by Mykyta Khlamov on 07.03.2023.
//

import XCTest
@testable import TestApp

final class TestAppTests: XCTestCase {
    
    let model: ModelProtocol = MockModel()
    var data: [SomeData] = []
    var favouriteData: [FavouriteData] = []
    
    override func setUp() async throws {
        await testFetchingData()
        testMappingDataToFavouriteData()
        testSavingFavouriteData()
    }
    
    func testFetchingData() async {
        do {
            let data = try await model.fetchData()
            XCTAssertEqual(data.count, 10)
            self.data = data
        } catch {
            XCTFail()
        }
    }
    
    func testMappingDataToFavouriteData() {
        let favouriteData = data.map { data in
            FavouriteTvShow(id: data.id, name: data.name, summary: data.summary)
        }
        
        XCTAssertEqual(favouriteData.count, 10)
        self.favouriteData = favouriteData
    }
    
    func testSavingFavouriteData() {
        do {
            try model.saveFavouriteData(favouriteData)
        } catch {
            XCTFail()
        }
    }
    
    func testLoadingFavouriteData() {
        let loadedFavouriteData = model.getFavouriteData()
        
        XCTAssertEqual(loadedFavouriteData.count, 10)
    }
    
}
