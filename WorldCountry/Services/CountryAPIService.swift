//
//  CountryAPIService.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//

import Foundation

class CountryAPIService {
    private let baseUrl = "https://restcountries.com/"
    private let path = "v3.1/independent?status=true"
    
    func fetchAllCountries() async throws -> [Country] {
        let completeUrl = baseUrl + path
        
        let apiUrl = URL(string: completeUrl)!
        print(#function, "Fetching data of all countries from URL: \(apiUrl)")

        let request = URLRequest(url: apiUrl)
        let (data, _) = try await URLSession.shared.data(for: request)
        let result = try JSONDecoder().decode([Country].self, from: data)
        
        return result
    }
}
