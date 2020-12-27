//
//  User.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/21/20.
//

import Foundation
import Firebase

struct User {
    let fullName: String
    let email: String
    let userName: String
    let uid: String
    let profileImageUrl: URL?
    var isBeingFollowed: Bool?
    var stats: UserRelationStats?
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == uid }
    
    init(uid: String, dict: [String: AnyObject]) {
        self.uid = uid
        
        self.fullName = dict["fullName"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
        self.userName = dict["userName"] as? String ?? ""
        
        let profileImageUrlStr = dict["profileImageUrl"] as? String ?? ""
        self.profileImageUrl = URL(string: profileImageUrlStr)
    }
}

struct UserRelationStats {
    var cntFollowers: Int
    var cntFollowings: Int
}
