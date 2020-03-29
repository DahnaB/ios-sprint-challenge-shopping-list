//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Dahna on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {
    
    let name: String
    var itemAdded: Bool = false
    var itemImage: UIImage? {
        guard let itemImage = UIImage(named: name) else { return nil }
        return itemImage
    }
}
