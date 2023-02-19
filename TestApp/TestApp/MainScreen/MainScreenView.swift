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
                
                HStack {
                    Spacer()
                    Button(action: viewModel.onlyFavouriteButtonTapped) {
                        HStack {
                            Image(systemName: viewModel.isFiltered ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                            Text("Only Favourite")
                                .foregroundColor(.primary)
                        }
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Button(action: viewModel.loadButtonTapped) {
                        Text("Load")
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }
                
                List(viewModel.favouriteData.filter({ viewModel.isFiltered ? ($0.favourite ? true : false) : true}),id: \.id) { data in
                    
                    NavigationLink(destination: FavouriteDataView(favouriteData: $viewModel.favouriteData[viewModel.favouriteData.firstIndex(where: { $0.id == data.id })!]), label: {
                        
                        HStack {
                            Image(systemName: data.favourite ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    viewModel.favouriteData[viewModel.favouriteData.firstIndex(where: { $0.id == data.id })!].favourite.toggle()
                                }
                            
                            VStack(alignment: .leading) {
                                Text(data.name)
                                    .font(.headline)
                                    .foregroundColor(Color("TitleTextColor"))
                                Text(data.summary)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }
                        }
                    })
                }
            }
            .alert("Error", isPresented: $viewModel.showingAlert, actions: {}, message: { Text(viewModel.alertMessage) })
            .navigationTitle("TV Shows")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
