//
//  NetworkService.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    var urlString: String { get set }
    
    func fetchData() async throws -> [SomeData]
}

class NetworkService: NetworkServiceProtocol {
    
    var urlString: String
    
    init(urlString: String = "https://api.tvmaze.com/shows") {
        self.urlString = urlString
    }
    
    func fetchData() async throws -> [SomeData] {
        guard let url = URL(string: urlString) else { throw NetworkServiceError.invalidUrl }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoded = try JSONDecoder().decode(TvShowsResponse.self, from: data)
            
            return decoded.results
        } catch {
            throw error
        }
    }
    
}
