//
//  FavouriteDataView.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import SwiftUI

struct FavouriteDataView: View {
    
    @Binding var favouriteData: FavouriteData
    
    var body: some View {
        
        VStack(alignment: .center) {
            HStack {
                Text(favouriteData.name)
                    .modifier(TitleTextModifier())
                FavouriteButton(isFavourite: favouriteData.isFavourite) { favouriteData.isFavourite.toggle() }
            }
            
            TextEditor(text: $favouriteData.summary)
                .modifier(SummaryTextModifier())
                .padding(.horizontal)
        }
    }
    
}
