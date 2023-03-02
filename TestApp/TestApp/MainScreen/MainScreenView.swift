//
//  MainScreenView.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import SwiftUI

struct MainScreenView: View {
    
    @StateObject private var viewModel = MainScreenViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                HStack(spacing: 90) {
                    OnlyFavouriteButton(action: viewModel.onlyFavouriteButtonTapped, isFiltered: $viewModel.isFiltered)
                    
                    LoadButton(action: viewModel.loadButtonTapped)
                }
                DataListView(favouriteData: $viewModel.favouriteData, isFiltred: viewModel.isFiltered, changeFavourite: viewModel.changeFavourite, index: viewModel.getFavouriteIndex)
            }
            .alert("Error", isPresented: $viewModel.showingAlert, actions: {}, message: { Text(viewModel.alertMessage) })
            .navigationTitle("TV Shows")
            .navigationBarTitleDisplayMode(.inline)
            .onDisappear(perform: viewModel.saveFavouriteData)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
