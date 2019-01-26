//
//  CreatePostVC.swift
//  GeekChat
//
//  Created by Akil Kumar Thota on 1/26/19.
//  Copyright © 2019 Akil Kumar Thota. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    
    @IBOutlet weak var profilePicImageView: UIImageView!
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var messageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        if messageTextView.text == "" {
            print("empty field")
        } else {
            DataService.sharedInstance.postMessage(withMessage: messageTextView.text, withuid: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (success) in
                print("successfully posted")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
