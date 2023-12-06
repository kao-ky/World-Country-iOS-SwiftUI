//
//  ContentView.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//

import SwiftUI
import CoreData

struct FavouriteListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [SortDescriptor(\.population, order: .reverse)])
    private var favouritesList: FetchedResults<CDCountry>

    var body: some View {
        NavigationView {
            if favouritesList.isEmpty {
                Text("No favourite countries yet")
                    .navigationTitle("Favourites")
            }
            else {
                List {
                    ForEach(favouritesList, id: \.self) { country in
                        VStack(alignment: .leading) {                        Text("Flag: \(country.flag)")
                            Text("Country: \(country.name)")
                            Text("Capital: \(country.capital)")
                            Text("Population: \(country.population)")
                        }
                    }
                    .onDelete(perform: onDelete)
                }
                .navigationTitle("Favourites")
                .toolbar {
                    EditButton()
                }
            }
        }
    }

    private func onDelete(offsets: IndexSet) {
        offsets.map { favouritesList[$0] }.forEach(viewContext.delete)

        do {
            try viewContext.save()
        } catch {
            print(#function, "Error when deleting favourite countries: \(error)")
        }
    }
}

struct FavouriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
