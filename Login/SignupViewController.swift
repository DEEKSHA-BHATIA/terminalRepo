//
//  SignupViewController.swift
//  Login
//
//  Created by Apple on 31/02/1940 Saka.
//  Copyright © 1940 Saka VVDN. All rights reserved.
//

import UIKit
class SignupViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate
{
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var contactField: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NameField.delegate = self
        emailField.delegate = self
        pwdField.delegate = self
        contactField.delegate = self
    }
    func isValidEmail(testStr:String) -> Bool
    {
        print("validate emilId: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.NameField.resignFirstResponder()
        self.emailField.resignFirstResponder()
        self.pwdField.resignFirstResponder()
        self.contactField.resignFirstResponder()
        return true
    }

    @IBAction func btn(_ sender: UIButton) {
        if isValidEmail(testStr: emailField.text!) && validate(value: contactField.text!) &&  (NameField.text != "") &&  (pwdField.text != "") == true
        {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let loggedInView: Singup1ViewController = storyboard.instantiateViewController(withIdentifier: "Singup1ViewController") as! Singup1ViewController
            loggedInView.word = NameField.text!
          present(loggedInView, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Please Enter Correct Details ", message: "Try Again!", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    func validate(value: String) -> Bool
    {
    let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result =  phoneTest.evaluate(with: value)
    return result
    }
}

