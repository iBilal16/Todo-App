//
//  ItemToSell+CoreDataProperties.swift
//  Todo App
//
//  Created by Bilal Ahmad on 28/07/2022.
//
//

import Foundation
import CoreData


extension ItemToSell {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemToSell> {
        return NSFetchRequest<ItemToSell>(entityName: "ItemToSell")
    }

    @NSManaged public var type: Int64
    @NSManaged public var quantity: Int64
    @NSManaged public var price: Int64
    @NSManaged public var name: String?
    @NSManaged public var id: Int64

}

extension ItemToSell : Identifiable {

}
