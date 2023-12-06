//
//  ContentView.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CountryListView()
                .tabItem {
                    Label("Countries", systemImage: "globe")
                }
            
            FavouriteListView()
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
