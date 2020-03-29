//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Dahna on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    var items: [ShoppingItem] = []
    
    init() {
        if UserDefaults.standard.bool(forKey: .reloadItemOnce) {
            loadFromPersistentStore()
        } else {
            setUserDefault()
        }
    }
    
    func setUserDefault() {
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for item in itemNames {
            
            self.items.append(ShoppingItem(name: item))
        }
        saveToPersistentStore()
        UserDefaults.standard.set(true, forKey: .reloadItemOnce)
    }
    
    func updateItem(index: Int) {
        items[index].itemAdded.toggle()
        saveToPersistentStore()
    }
    
    func itemsAddedCount() -> Int {
        var count = 0
        for item in items {
            if item.itemAdded == true {
                count += 1
            }
        }
         return count
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
