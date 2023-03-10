//
//  FavouriteTvShow.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

protocol FavouriteData: SomeData, Encodable {
    var isFavourite: Bool { get set }
}

struct FavouriteTvShow: FavouriteData {
    
    var id: Int
    var name: String
    @ClearString var summary: String
    var isFavourite: Bool = false

}

@propertyWrapper
struct ClearString: Codable {
    private var string: String = ""
    private var substringsToRemove = ["<p>", "</p>", "<b>", "</b>", "<i>", "</i>"]
    
    var wrappedValue: String {
        get { string }
        set {
            var newValue = newValue
            substringsToRemove.forEach { substring in
                newValue = newValue.replacingOccurrences(of: substring, with: "")
            }
            string = newValue
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
