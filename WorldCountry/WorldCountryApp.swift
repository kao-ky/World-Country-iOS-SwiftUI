//
//  WorldCountryApp.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//

import SwiftUI

@main
struct WorldCountryApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var countryManager = CountryViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(countryManager)
        }
    }
}
