//
//  AuthService.swift
//  GeekChat
//
//  Created by Akil Kumar Thota on 1/26/19.
//  Copyright © 2019 Akil Kumar Thota. All rights reserved.
//

import UIKit
import Firebase

class AuthService {
    
    private init() {}
    static let sharedInstance = AuthService()
    
    
    func registerUser(withEmail email:String, withPassword password:String,completion:@escaping (_ success:Bool,_ error:Error?)->()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (userData, error) in
            if error != nil {
                print("registration failed")
                completion(false,error)
                return
            }
            guard let user = userData?.user,let userEmail = user.email else {
                completion(false,nil)
                return
            }
            let userDataDict = [
                "provider":user.providerID,
                "email":userEmail
            ]
            DataService.sharedInstance.createDBUser(uid: user.uid, userData: userDataDict)
            completion(true,nil)
        }
        
    }
    
    
    func logInUser(withEmail email:String, withPassword password:String,completion:@escaping (_ success:Bool,_ error:Error?)->()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (userData, error) in
            
            if error != nil {
                print("registration failed")
                completion(false,error)
                return
            }
            
            guard let user = userData?.user else {
                completion(false,nil)
                return
            }
            print(user.email! + "is logged in")
            completion(true,nil)
        }
        
    }
    
}
