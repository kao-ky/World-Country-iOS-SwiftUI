//
//  CapitalMapInfo.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//

import Foundation
import CoreLocation

struct CapitalMapInfo: Identifiable {
    let id = UUID().uuidString
    let name: String
    let coordinate: CLLocationCoordinate2D
}
