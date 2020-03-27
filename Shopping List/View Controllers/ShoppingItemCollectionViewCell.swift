//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Dahna on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let unwrappedShoppingItem = shoppingItem else { return }
        itemImageView.image = UIImage(data: unwrappedShoppingItem.itemImage)
        itemNameLabel.text = unwrappedShoppingItem.name
    }
}
