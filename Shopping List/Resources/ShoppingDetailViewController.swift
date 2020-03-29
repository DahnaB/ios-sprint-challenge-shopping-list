//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Dahna on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {
    
    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userAddressTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    
    
    
    @IBAction func submitOrderButtonTapped(_ sender: Any) {
        
        if userNameTextField.text != "",
            userAddressTextField.text != "" {
            showAlert()
        } else {
            return
        }
    }
    
    func updateViews() {
        guard let controller = shoppingItemController else { return }
        let count = controller.itemsAddedCount()
        itemCountLabel.text = "You have \(count) item(s) in your cart."
    }
    
    func showAlert() {
        
        guard let unwrappedName = userNameTextField.text,
            let unwrappedAddress = userAddressTextField.text else { return }
        
        let alert = UIAlertController(title: "Thanks, \(unwrappedName)!", message: "Your order will be delivered to \(unwrappedAddress) in 15 Minutes!", preferredStyle: .alert)
        let allowAction = UIAlertAction(title: "Allow", style: .default, handler: nil)
        let dontAllowAction = UIAlertAction(title: "Don't Allow", style: .cancel, handler: nil)
        alert.addAction(allowAction)
        alert.addAction(dontAllowAction)
        present(alert, animated: true, completion: nil)
    }
}

