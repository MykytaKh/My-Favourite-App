//
//  FavouriteButton.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 02.03.2023.
//

import SwiftUI

struct FavouriteButton: View {
    
    let isFavourite: Bool
    let onTapGesture: () -> Void
    
    var body: some View {
        Image(systemName: isFavourite ? "star.fill" : "star")
            .foregroundColor(.Button.favourite)
            .onTapGesture(perform: onTapGesture)
    }
    
}
