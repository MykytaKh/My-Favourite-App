//
//  MockNetworkService.swift
//  TestAppTests
//
//  Created by Mykyta Khlamov on 07.03.2023.
//

import Foundation
@testable import TestApp

final class MockNetworkService: NetworkServiceProtocol {
    
    let urlString: String = "testingData"
    
    func fetchData() async throws -> [SomeData] {
        guard let path = Bundle.main.url(forResource: urlString, withExtension: "json") else { throw NetworkServiceError.invalidUrl }
        return try JSONDecoder().decode([TvShow].self, from: Data(contentsOf: path))
    }
        
}
