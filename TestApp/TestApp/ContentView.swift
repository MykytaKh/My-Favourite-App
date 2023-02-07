//
//  ContentView.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    private var viewModel = ViewModel()
    @State private var favouriteData: [FavouriteData] = []
    @State private var isFiltered = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                HStack {
                    Spacer()
                    Button(action: onlyFavouriteButtonTapped) {
                        HStack {
                            Image(systemName: isFiltered ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                            Text("Only Favourite")
                                .foregroundColor(.primary)
                        }
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Button(action: LoadButtonTapped) {
                        Text("Load")
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }
                
                List(favouriteData.filter({ isFiltered ? ($0.favorite ? true : false) : true}),id: \.id) { data in
                    
                    NavigationLink(destination: FavouriteDataView(favouriteData: $favouriteData[favouriteData.firstIndex(where: { $0.id == data.id })!]), label: {
                        
                        HStack {
                            Image(systemName: data.favorite ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    favouriteData[favouriteData.firstIndex(where: { $0.id == data.id })!].favorite.toggle()
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
            .alert("Error", isPresented: $showingAlert, actions: {}, message: { Text(alertMessage) })
            .navigationTitle("TV Shows")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func LoadButtonTapped() {
        Task {
            do {
                favouriteData = try await viewModel.fetchData()
            } catch {
                alertMessage = error.localizedDescription + "\nPlease try again."
                showingAlert.toggle()
            }
        }
    }
    
    private func onlyFavouriteButtonTapped() {
        isFiltered.toggle()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
