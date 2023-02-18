//
//  TvShowsResponse.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 18.02.2023.
//

import Foundation

struct TvShowsResponse: Decodable {
    var results: [TvShow]
}
