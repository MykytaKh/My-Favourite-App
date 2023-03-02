//
//  DataListView.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 02.03.2023.
//

import SwiftUI

struct DataListView: View {
    
    @Binding var favouriteData: [FavouriteData]
    let isFiltred: Bool
    let changeFavourite: ((_ id: Int) -> Void)
    let index: ((_ id: Int) -> Int)
    
    var body: some View {
        List(favouriteData.filter({ isFiltred ? $0.isFavourite : true }),id: \.id) { data in
            NavigationLink(destination:
                            FavouriteDataView(favouriteData: $favouriteData[index(data.id)]),
                           label: {
                DataListRow(name: data.name, summary: data.summary, isFavourite: data.isFavourite) { changeFavourite(data.id) }
            })
        }
    }
    
}
