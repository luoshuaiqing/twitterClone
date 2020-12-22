//
//  User.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/21/20.
//

import Foundation

struct User {
    let fullName: String
    let email: String
    let userName: String
    let profileImageUrl: String
    let uid: String
    
    init(uid: String, dict: [String: AnyObject]) {
        self.uid = uid
        
        self.fullName = dict["fullName"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
        self.userName = dict["userName"] as? String ?? ""
        self.profileImageUrl = dict["profileImageUrl"] as? String ?? ""
    }
}
