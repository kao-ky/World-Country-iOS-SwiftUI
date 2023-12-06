//
//  Country.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//

import Foundation

struct Country: Codable, Identifiable {
    let id = UUID().uuidString
    let name: Name
    let capital: [String]
    let population: Int
    let area: Double
    let flag: String
    let capitalInfo: CapitalInfo
}

struct Name: Codable {
    let common, official: String
}

struct CapitalInfo: Codable {
    let latlng: [Double]
}
