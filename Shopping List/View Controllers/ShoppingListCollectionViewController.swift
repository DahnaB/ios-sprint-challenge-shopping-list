//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Dahna on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit



class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingItemController = ShoppingItemController()


    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        
        if segue.identifier == "DetailShowSegue" {
            guard let destinationVC = segue.destination as? ShoppingDetailViewController else { return }
            
            destinationVC.shoppingItemController = shoppingItemController
            
        }
        
        // Pass the selected object to the new view controller.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { fatalError("Cell is not a ShoppingItemCollectionViewCell")}
    
        let item = shoppingItemController.items[indexPath.item]
        
        cell.shoppingItem = item
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
        guard let cell = collectionView.cellForItem(at: indexPath) as? ShoppingItemCollectionViewCell else { return }
        cell.wasAddedText()
        
        shoppingItemController.updateItem(index: indexPath.item)
        
     }
}
