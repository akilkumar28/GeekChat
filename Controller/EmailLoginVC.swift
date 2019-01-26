//
//  EmailLoginVC.swift
//  GeekChat
//
//  Created by Akil Kumar Thota on 1/26/19.
//  Copyright © 2019 Akil Kumar Thota. All rights reserved.
//

import UIKit

class EmailLoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: InsetTextField!
    
    @IBOutlet weak var passwordTextField: InsetTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
        guard let email = emailTextField.text, email != "" , let password = passwordTextField.text, password != "" else {
            displayAlert(title: "Empty fields", Body: "Please fill out all the fields")
            return
        }
        emailTextField.text = ""
        passwordTextField.text = ""
        AuthService.sharedInstance.logInUser(withEmail: email, withPassword: password) { (success, error) in
            if (error != nil) {
                AuthService.sharedInstance.registerUser(withEmail: email, withPassword: password, completion: { (success, error) in
                    if error != nil || !success {
                        self.displayAlert(title: "Error", Body: error?.localizedDescription)
                        return
                    }
                    AuthService.sharedInstance.logInUser(withEmail: email, withPassword: password, completion: { (success, error) in
                        if error != nil || !success {
                            self.displayAlert(title: "Error", Body: error?.localizedDescription)
                            return
                        }
                        print("successfully logged in after all loops....!")
                        let feedVC = self.storyboard?.instantiateInitialViewController()
                        self.present(feedVC!, animated: true, completion: nil)
                    })
                    
                })
            } else {
                print("successfully logged in after all loops....!")
                let feedVC = self.storyboard?.instantiateInitialViewController()
                self.present(feedVC!, animated: true, completion: nil)
            }
        }
        
    }
    
    func displayAlert(title:String?,Body:String?) {
        let alertVC = UIAlertController(title: title, message: Body, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertVC.addAction(dismissAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    
}
