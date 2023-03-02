//
//  DataListRow.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 02.03.2023.
//

import SwiftUI

struct DataListRow: View {
    
    let name: String
    let summary: String
    let isFavourite: Bool
    let onTapGesture: (() -> Void)
    
    var body: some View {
        HStack {
            FavouriteButton(isFavourite: isFavourite, onTapGesture: onTapGesture)
            
            VStack(alignment: .leading) {
                Text(name)
                    .modifier(TitleTextModifier())
                Text(summary)
                    .modifier(SummaryTextModifier())
            }
        }
    }
    
}
