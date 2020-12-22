//
//  UserService.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/21/20.
//

import Foundation
import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dict = snapshot.value as? [String: AnyObject] else { return }
            
            let user = User(uid: uid, dict: dict)
            
            
        }
    }
}
