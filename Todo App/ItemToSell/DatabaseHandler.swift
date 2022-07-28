//
//  DatabaseHandler.swift
//  Todo App
//
//  Created by Bilal Ahmad on 28/07/2022.
//

import Foundation
import CoreData
import UIKit

class DatabaseHandler {
    
    func saveData(name: String, price: Int, quantity: Int) {
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let dataObject = NSEntityDescription.insertNewObject(forEntityName: "ItemToSell", into: context) as! ItemToSell
        dataObject.name = name
        dataObject.price = Int64(price)
        dataObject.quantity = Int64(quantity)
        
        do {
            try context.save()
            print("Data has been saved")
        }
        
        catch {
            print("Error has been occured during save data")
        }
        
        
    }
    
    func fetchData() -> [ItemToSell] {
        
        var sellerData = [ItemToSell]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            sellerData =  try context.fetch(ItemToSell.fetchRequest()) as! [ItemToSell]
        }
        
        catch {
            print("Error occured durning fetch request")
        }
        
        return sellerData
    }
}
