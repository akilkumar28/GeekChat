//
//  MeVC.swift
//  GeekChat
//
//  Created by Akil Kumar Thota on 1/26/19.
//  Copyright © 2019 Akil Kumar Thota. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {
    
    
    @IBOutlet weak var profilePicImageView: UIImageView!
    
    @IBOutlet weak var userEmailLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        userEmailLabel.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        do {
            try  Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
