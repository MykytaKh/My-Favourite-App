//
//  NetworkServiceError.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 06.02.2023.
//

import Foundation

enum NetworkServiceError: Error {
    
    case invalidUrl
    
}

extension NetworkServiceError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return NSLocalizedString(
                "The provided url is not valid.",
                comment: "Invalid url"
            )
        }
    }
    
}
