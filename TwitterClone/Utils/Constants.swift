//
//  Constants.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/21/20.
//

import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_TWEETS = DB_REF.child("tweets")
let REF_USER_TWEETS = DB_REF.child("user-tweets")
let REF_USER_FOLLOWERS = DB_REF.child("user-followers")
let REF_USER_FOLLOWINGS = DB_REF.child("user-followings")
let REF_TWEET_REPLIES = DB_REF.child("tweet-replies")

typealias DatabaseCompletion = (Error?, DatabaseReference) -> Void
