//
//  MainScreenView-ViewModel.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 26.01.2023.
//

import Foundation

extension MainScreenView {
    
    @MainActor final class MainScreenViewModel: ObservableObject {
        
        @Published var favouriteData: [FavouriteData]
        @Published var isFiltered = false
        @Published var showingAlert = false
        @Published var alertMessage = ""
        private let model: ModelProtocol
        
        init(model: ModelProtocol = MainScreenModel()) {
            self.model = model
            favouriteData = model.getFavouriteData()
        }
        
        func loadButtonTapped() {
            Task { await fetchData() }
        }
        
        func onlyFavouriteButtonTapped() {
            isFiltered.toggle()
        }
        
        func getFavouriteIndex(for id: Int) -> Int {
            favouriteData.firstIndex(where: { $0.id == id }) ?? 0
        }
        
        func changeFavourite(for id: Int) {
            guard let index = favouriteData.firstIndex(where: { $0.id == id }) else { return }
            favouriteData[index].isFavourite.toggle()
        }
        
        private func fetchData() async {
            do {
                favouriteData = try await model.fetchData().map { data in
                    FavouriteTvShow(id: data.id, name: data.name, summary: data.summary)
                }
            } catch {
                showError(description: error.localizedDescription)
            }
        }
        
        func saveFavouriteData() {
            do {
                try model.saveFavouriteData(favouriteData)
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
