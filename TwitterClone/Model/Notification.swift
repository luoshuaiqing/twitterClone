//
//  Notification.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/31/20.
//

import Foundation

enum NotificationType: Int {
    case follow
    case like
    case reply
    case retweet
    case mention
}

struct Notification {
    var tweetID: String?
    var timestamp: Date!
    let user: User
    var tweet: Tweet?
    var type: NotificationType!
    
    init(user: User, dict: [String: AnyObject]) {
        self.user = user
        
        if let tweetId = dict["tweetId"] as? String {
            self.tweetID = tweetId
        }
        
        if let timestamp = dict["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
        
        if let type = dict["type"] as? Int {
            self.type = NotificationType(rawValue: type)
        }
    }
}
