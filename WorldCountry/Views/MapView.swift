//
//  MapView.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//

import MapKit
import SwiftUI

struct MapView: View {
    var capital: String
    var coordinate: CLLocationCoordinate2D
    
    @State private var region: MKCoordinateRegion
    @State private var showingTitle = false
    
    init(capital: String, coordinate: CLLocationCoordinate2D) {
        self.capital = capital
        self.coordinate = coordinate
        _region = State(
            initialValue: MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.6, longitudeDelta: 0.6)
            )
        )
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [CapitalMapInfo(name: capital, coordinate: coordinate)]) { location in
            MapAnnotation(coordinate: location.coordinate) {
                Image(systemName: "mappin.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.red)
                    .overlay {
                        Text(capital)
                            .padding(10)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .frame(width: 400)
                            .offset(y: -45)
                            .opacity(showingTitle ? 0.9 : 0)
                    }
                    .onTapGesture {
                        showingTitle.toggle()
                    }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let capital = "Montreal, QC"
        let coordinate = CLLocationCoordinate2D(latitude: 45.5019, longitude: -73.5674)
        MapView(capital: capital, coordinate: coordinate)
    }
}
