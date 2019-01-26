//
//  DataService.swift
//  GeekChat
//
//  Created by Akil Kumar Thota on 1/26/19.
//  Copyright © 2019 Akil Kumar Thota. All rights reserved.
//

import UIKit
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    
    private init() {}
    static let sharedInstance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE : DatabaseReference {
        
        return _REF_BASE
    }
    var REF_USERS : DatabaseReference {
        
        return _REF_USERS
    }
    var REF_GROUPS : DatabaseReference {
        
        return _REF_GROUPS
    }
    var REF_FEED : DatabaseReference {
        
        return _REF_FEED
    }
    
    
    func createDBUser(uid:String,userData:[String:Any]) {
        
        REF_USERS.child(uid).setValue(userData  )
        
    }
    
    
    
    func postMessage(withMessage message:String, withuid uid:String,withGroupKey key:String?, completion: @escaping (_ success:Bool) -> () ) {
        
        if key != nil  {
            // this is for group
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content" : message,
                                                        "senderId": uid])
            completion(true)
        }
    }
    
    
}
