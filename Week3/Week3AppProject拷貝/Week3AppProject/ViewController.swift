//
//  ViewController.swift
//  Week3AppProject
//
//  Created by 謝霆 on 2024/7/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var checkInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var accountInput: UITextField!
    @IBOutlet weak var checkLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchSegments(_ sender: UISegmentedControl) {
        let viewController = self
        
        let segmentValue = segmentValue.selectedSegmentIndex
        
        switch segmentValue {
        case 0:
        viewController.checkLabel.textColor = UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1)
        viewController.checkInput.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        viewController.checkInput.isEnabled = false
        case 1:
        viewController.checkLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        viewController.checkInput.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        viewController.checkInput.isEnabled = true
        viewController.checkInput.isEnabled = true
                default:
            return
                }
        
    }
    @IBOutlet weak var segmentValue: UISegmentedControl!
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        let checkInputText = checkInput.text ?? ""
        let accountInputText = accountInput.text ?? ""
        let passwordInputText = passwordInput.text ?? ""
        let segmentValue = segmentValue.selectedSegmentIndex
        let viewController = self
        
        var errorStatus = ""
        var signUpValid: Bool = true
        
        func signUpIsValid() {
            
            if accountInputText.isEmpty {
                errorStatus = "Account should not be empty"
                signUpValid = false
            } else if passwordInputText.isEmpty {
                errorStatus = "Password should not be empty"
                signUpValid = false
            } else if checkInputText.isEmpty{
                 errorStatus = "Check Password should not be empty"
                signUpValid = false
            } else if passwordInputText != checkInputText {
                errorStatus = "Sign up failed"
                signUpValid = false
            } else {
                signUpValid = true
            }
            }
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        func loginAlert() {
           
            if accountInputText == "appworks_school" && passwordInputText == "1234" {
                let controller = UIAlertController(title: "Welcome", message: "You have successfully logged in AppWorks School", preferredStyle: .alert)
                controller.addAction(okAction)
                viewController.present(controller, animated: true)
            } else {
                let errorController = UIAlertController(title: "Error", message: "Login fail", preferredStyle: .alert)
                errorController.addAction(okAction)
                viewController.present(errorController, animated: true)
            }
        }
        func signUpAlert() {
            if signUpValid == true {
                let controller = UIAlertController(title: "Welcome", message: "You have successfully joined AppWorks School", preferredStyle: .alert)
                controller.addAction(okAction)
                viewController.present(controller, animated: true)
            } else {
                let errorController = UIAlertController(title: "Error", message: errorStatus, preferredStyle: .alert)
                errorController.addAction(okAction)
                viewController.present(errorController, animated: true)
            }
        }
        
        func configureAlert(segmentValue: Int) {
            switch segmentValue {
            case 0:
                loginAlert()
                
            case 1:
                signUpAlert()
                
            default:
                return
            }
        }
        
        signUpIsValid()
        configureAlert(segmentValue: segmentValue)
    }
    
}

