//
//  TvShow.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

protocol SomeData {
    var id: Int { get set }
    var name: String { get set }
    var summary: String { get set }
}

struct TvShow: SomeData, Decodable {
    var id: Int
    var name: String
    var summary: String
}
