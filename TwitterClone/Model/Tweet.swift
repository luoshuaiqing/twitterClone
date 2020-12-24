//
//  Tweet.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/23/20.
//

import Foundation

struct Tweet {
    let caption: String
    let tweetId: String
    let uid: String
    let likes: Int
    var timestamp: Date!
    let retweetCount: Int
    let user: User
    
    init(user: User, tweetId: String, dict: [String: Any]) {
        self.user = user
        self.tweetId = tweetId
        
        self.caption = dict["caption"] as? String ?? ""
        self.uid = dict["uid"] as? String ?? ""
        self.likes = dict["likes"] as? Int ?? 0
        self.retweetCount = dict["retweets"] as? Int ?? 0
        
        if let timestamp = dict["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
    }
}
