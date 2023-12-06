//
//  CountryViewModel.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//

import Foundation

class CountryViewModel: ObservableObject {
    @Published var countriesList = [Country]()
    
    let apiService = CountryAPIService()
    
    init() {
        Task { @MainActor in 
            do {
                self.countriesList = try await apiService.fetchAllCountries()
                sortByName()
            } catch {
                print(#function, "Unable to fetch data of countries from API. Error: \(error)")
            }
        }
    }
    
    func sortByName() {
        self.countriesList = self.countriesList.sorted { $0.name.common < $1.name.common }
    }
}
