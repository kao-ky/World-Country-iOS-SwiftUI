//
//  CountryDetailView.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//

import CoreLocation
import SwiftUI

struct CountryDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext

    let country: Country
    
    @FetchRequest private var favouritedCountry: FetchedResults<CDCountry>
    
    // alert
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    @State private var showingAlert = false
    
    init(country: Country) {
        self.country = country
        _favouritedCountry = FetchRequest<CDCountry>(sortDescriptors: [], predicate: NSPredicate(format: "%K == %@", "name", country.name.common))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack {
                Text(country.flag)
                    .font(.system(size: 100))
                Text(country.name.common)
                    .offset(y: -15)
            }
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: 120)
            
            List {
                HStack {
                    Text("Offical Name:")
                        .frame(width: 120)
                        .bold()
                    Text(country.name.official)
                }
                
                HStack {
                    Text("Population:")
                        .frame(width: 120)
                        .bold()
                    Text(country.population.description)
                }
                
                HStack {
                    Text("Area:")
                        .frame(width: 120)
                        .bold()
                    Text("\(Int(country.area)) km²")
                }
                
                HStack {
                    Text("Capital:")
                        .frame(width: 120)
                        .bold()
                    Text("\(country.capital.joined(separator: ", "))")
                }
            }
            .listStyle(.plain)
            .scrollDisabled(true)
            .frame(maxHeight: 210)
            
            MapView(capital: country.capital[0],
                    coordinate: CLLocationCoordinate2D(latitude: country.capitalInfo.latlng[0],
                                                       longitude: country.capitalInfo.latlng[1])
            )
            .frame(maxHeight: .infinity)
        }
        .padding(20)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Favourite") {
                if isFavourited() {
                    self.alertTitle = "Error"
                    self.alertMsg = "You have already favourited this country"
                } else {
                    saveToFavourite()
                    self.alertTitle = "Success"
                    self.alertMsg = "This country is in your favourites list now"
                }
                self.showingAlert.toggle()
            }
        }
        .alert(self.alertTitle, isPresented: $showingAlert) {
            Button("Dismiss", role: .none) {}
        } message: {
            Text(self.alertMsg)
        }
    }
    
    private func saveToFavourite() {
        let cdCountry = CDCountry(context: viewContext)
        
        cdCountry.capital = country.capital[0]
        cdCountry.flag = country.flag
        cdCountry.name = country.name.common
        cdCountry.population = Int64(country.population)
        
        do {
            try viewContext.save()
            print(#function, "Country \(country.name.common) saved to Favourites")
        } catch {
            print(#function, "Error when saving country to favourite: \(error)")
        }
    }
    
    private func isFavourited() -> Bool {
        return favouritedCountry.count != 0
    }
}

//struct CountryDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryDetailView(country: )
//    }
//}
