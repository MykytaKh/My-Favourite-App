//
//  FavouriteTvShow.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

protocol FavouriteData: SomeData {
    var favourite: Bool { get set }
}

struct FavouriteTvShow: FavouriteData {
    
    var id: Int
    var name: String
    var summary: String
    var favourite: Bool = false

}
