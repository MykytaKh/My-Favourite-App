//
//  FavouriteData.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

protocol Favourite: SomeData {
    var favorite: Bool { get set }
}

struct FavouriteData: Favourite {
    
    var id: Int
    var name: String
    var summary: String
    var favorite: Bool = false

}
