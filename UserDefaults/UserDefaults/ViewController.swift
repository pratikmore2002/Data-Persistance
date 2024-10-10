//
//  ViewController.swift
//  UserDefaults
//
//  Created by Neosoft on 08/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var myLbl: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UserDefaults.standard.value(forKey: "username")
        if value != nil{
           myLbl.text = "Hello,\(value!)"
        }
    }
    

    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(txtField.text!, forKey: "username")
        let alert = UIAlertController(title: "Saving", message: "Data saved  in UserDefaults successfully.", preferredStyle: .alert )
        let okButton = UIAlertAction(title: "OK", style: .default){
            (action) in
            print("data has been saved.")
            
        }
        alert.addAction(okButton )
        present(alert,animated: true,completion: nil)
        //txtField.text = " "
        self.myLbl.text = "Hello,\(self.txtField.text!)"
    }
    
    
    
}

