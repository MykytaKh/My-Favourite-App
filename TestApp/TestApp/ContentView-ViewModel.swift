//
//  ContentView-ViewModel.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

extension ContentView {
    
    @MainActor final class ViewModel: ObservableObject {
        
        @Published var favouriteData: [FavouriteData] = []
        @Published var isFiltered = false
        @Published var showingAlert = false
        @Published var alertMessage = ""
        private let model: ModelProtocol
        
        init(model: ModelProtocol = Model()) {
            self.model = model
        }
        
        func loadButtonTapped() {
            Task { await fetchData() }
        }
        
        func onlyFavouriteButtonTapped() {
            isFiltered.toggle()
        }
        
        private func fetchData() async {
            do {
                favouriteData = try await model.networkService.fetchData().map { data in
                    FavouriteTvShow(id: data.id, name: data.name, summary: data.summary)
                }
            } catch {
                showError(description: error.localizedDescription)
            }
        }
        
        private func showError(description: String) {
            alertMessage = description + "\nPlease try again."
            showingAlert.toggle()
        }
        
    }
    
}
