//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Dahna on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController: Codable {
    
    var items: [ShoppingItem] = []
    
    var addedItems: [ShoppingItem] {
        
        get {
            let added: [ShoppingItem] = items.filter{item in item.itemAdded}
            return added
        }
    }
    
    var notAddedItems: [ShoppingItem] {
        
        get {
            let notAdded: [ShoppingItem] = items.filter{item in !item.itemAdded}
            return notAdded
        }
    }
    
    func setUserDefault() {
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for item in itemNames {
            guard let image = UIImage(named: item),
                let imageData = UIImagePNGRepresentation(image) else { return }
            self.items.append(ShoppingItem(name: item, itemAdded: false, itemImage: imageData))
        }
        
    }
    
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let itemsURL = documentsDir?.appendingPathComponent("items.plist")
        
        return itemsURL
    }
    
    func saveToPersistentStore() {
        do {
            let encoder = PropertyListEncoder()
            
            let itemsPlist = try encoder.encode(items)
            
            guard let persistentFileURL = persistentFileURL else {return}
            
            try itemsPlist.write(to: persistentFileURL)
            
        } catch {
            print("Error saving item: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        guard let persistentFileURL = persistentFileURL else { return }
        
        do {
            let decoder = PropertyListDecoder()
            
            let itemsPlist = try Data(contentsOf: persistentFileURL)
            
            let items = try decoder.decode([ShoppingItem].self, from: itemsPlist)
            
            self.items = items
        } catch {
            print("Error decoding items: \(error)")
        }
    }
}
