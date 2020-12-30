//
//  ActionSheetViewModel.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/30/20.
//

import Foundation

struct ActionSheetViewModel {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
}

enum ActionSheetOptions {
    case follow(User)
    case unfollow(User)
    case report
    case delete
    
    var description: String {
        switch self {
        case .follow(let user):
            return "Follow @\(user.userName)"
        case .unfollow(let user):
            return "Unfollow @\(user.userName)"
        case .report:
            return "Report Tweet"
        case .delete:
            return "Delete Tweet"
        }
    }
}
