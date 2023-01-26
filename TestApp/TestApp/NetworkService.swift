//
//  NetworkService.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    var urlString: String { get set }
    
    func fetchData() async -> [SomeData]?
}

class NetworkService: NetworkServiceProtocol {
    
    var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func fetchData() async -> [SomeData]? {
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([TvShow].self, from: data) {
                return decodedResponse
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
}
