//
//  ProfileHeaderViewModel.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/25/20.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
            case .tweets: return "Tweets"
            case .replies: return "Tweets & Replies"
            case .likes: return "Likes"
        }
    }
}

struct ProfileHeaderViewModel {
    
    private let user: User
    
    let userNameText: String
    
    var followerString: NSAttributedString? {
        guard let cntFollowers = user.stats?.cntFollowers else {
            return NSAttributedString(string: "Loading...", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray])
        }
        return attributedText(withValue: cntFollowers, text: "followers")
    }
    
    var followingString: NSAttributedString? {
        guard let cntFollowings = user.stats?.cntFollowings else {
            return NSAttributedString(string: "Loading...", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray])
        }
        return attributedText(withValue: cntFollowings, text: "following")
    }
    
    var actionButtonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        } else {
            guard let isBeingFollowed = user.isBeingFollowed else { return "Loading..." }
            if isBeingFollowed {
                return "Following"
            } else {
                return "Follow"
            }
        }
    }
    
    init(user: User) {
        self.user = user
        self.userNameText = "@\(user.userName)"
    }
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(
                                string: "\(value)",
                                attributes: [
                                    .font: UIFont.boldSystemFont(ofSize: 14)
                                ])
        
        attributedTitle.append(NSAttributedString(
                                string: " \(text)",
                                attributes: [
                                    .font: UIFont.systemFont(ofSize: 14),
                                    .foregroundColor: UIColor.lightGray
                                ]))
        
        return attributedTitle
    }
}
