//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Dahna on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var notAddedToggleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var wasAdded = false
    
    var shoppingItem: ShoppingItem? {
        
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let unwrappedShoppingItem = shoppingItem else { return }
        notAddedToggleLabel.text = unwrappedShoppingItem.itemAdded ? "Added" : "Not Added"
        itemImageView.image = UIImage(named: unwrappedShoppingItem.name)
        itemNameLabel.text = unwrappedShoppingItem.name
    
    }
    
    func wasAddedText() {
        wasAdded = !wasAdded
        notAddedToggleLabel.text = wasAdded ? "Added" : "Not Added"

    }
}
