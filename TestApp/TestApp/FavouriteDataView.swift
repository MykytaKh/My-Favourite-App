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
             .font(.headline)
             .foregroundColor(Color("TitleTextColor"))
             Image(systemName: favouriteData.favorite ? "star.fill" : "star")
                 .foregroundColor(.yellow)
                 .onTapGesture {
                     favouriteData.favorite.toggle()
                 }
         }
             
         TextEditor(text: $favouriteData.summary)
                         .foregroundColor(.secondary)
                         .padding(.horizontal)
     }

            
                
    }
}
