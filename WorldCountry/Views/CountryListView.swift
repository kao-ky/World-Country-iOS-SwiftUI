//
//  CountryListView.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//

import SwiftUI

struct CountryListView: View {
    @EnvironmentObject private var countryManager: CountryViewModel
    
    var body: some View {
        NavigationView {
            List(self.countryManager.countriesList) { country in
                NavigationLink(destination: CountryDetailView(country: country)) {
                    Text(country.name.common)
                }
            }
            .navigationTitle("Countries")
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
            .environmentObject(CountryViewModel())
    }
}
