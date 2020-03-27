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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        
        
        
    }
    
    
    
    
    @IBAction func submitOrderButtonTapped(_ sender: Any) {
        showAlert()
    }
    
    func showAlert() {
        
        guard let unwrappedText = userNameTextField.text,
            let unwrappedAddress = userAddressTextField.text else { return }
        
        let alert = UIAlertController(title: "Thanks, \(unwrappedText)!", message: "Your order will be delivered to \(unwrappedAddress) in 15 Minutes!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
