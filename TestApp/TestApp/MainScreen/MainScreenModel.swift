//
//  MainScreenModel.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

protocol ModelProtocol {
    var networkService: NetworkServiceProtocol { get set }
    
    func fetchData() async throws -> [SomeData]
}

final class MainScreenModel: ModelProtocol {
    
    var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchData() async throws -> [SomeData] {
        try await networkService.fetchData()
    }
}
