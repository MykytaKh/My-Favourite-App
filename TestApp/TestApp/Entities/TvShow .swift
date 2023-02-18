//
//  TvShow.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

protocol SomeData: Codable {
    var id: Int { get set }
    var name: String { get set }
    var summary: String { get set }
}

struct TvShow: SomeData {
    var id: Int
    var name: String
    var summary: String
}
