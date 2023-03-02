//
//  OnlyFavouriteButton.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 19.02.2023.
//

import SwiftUI

struct OnlyFavouriteButton: View {
    
    var action: () -> Void
    @Binding var isFiltered: Bool
    
    var body: some View {
        
        Button(action: action) {
            HStack {
                Image(systemName: isFiltered ? "star.fill" : "star")
                    .foregroundColor(.Button.favourite)
                Text("Only Favourite")
                    .foregroundColor(.Button.favourite)
                    .fontWeight(.semibold)
            }
        }
        .buttonStyle(BorderButtonStyle(color: .Button.favourite))
    }
    
}
