//
//  ProfileHeaderViewModel.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/25/20.
//

import Foundation

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
