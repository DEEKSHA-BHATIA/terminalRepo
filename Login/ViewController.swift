//
//  ViewController.swift
//  Login
//
//  Created by Apple on 28/02/1940 Saka.
//  Copyright © 1940 Saka VVDN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.contentMode = .scaleToFill
       
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "two.jpg")!)
        
    }
    @IBAction func loginButton(_ sender: UIButton) {
        print("hello")
        if(emailField.text == "Deeksha" && passwordField.text == "bhatia")
        {
           errorLabel.text = ""
        }
        else
        {
            
            let alert = UIAlertController(title: "Incorrect Username or Password", message: "Try Again!", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
       
        }
    }
    
}

