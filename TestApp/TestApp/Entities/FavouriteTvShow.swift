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
    @ClearString var summary: String
    var favourite: Bool = false

}

@propertyWrapper
struct ClearString {
    private var string: String = ""
    private let substringsToRemove = ["<p>", "</p>", "<b>", "</b>", "<i>", "</i>"]
    
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
