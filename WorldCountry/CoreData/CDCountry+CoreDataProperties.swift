//
//  CDCountry+CoreDataProperties.swift
//  WorldCountry
//
//  Created by Kao on 2023-07-11.
//
//

import Foundation
import CoreData


extension CDCountry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCountry> {
        return NSFetchRequest<CDCountry>(entityName: "CDCountry")
    }

    @NSManaged public var name: String
    @NSManaged public var capital: String
    @NSManaged public var population: Int64
    @NSManaged public var flag: String

}

extension CDCountry : Identifiable {

}
