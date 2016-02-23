//
//  UserController.swift
//  Timeline
//
//  Created by Kaytee on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class UserController {
    
    static let sharedController = UserController()
    
    let currentUser: User! = nil
    
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        
    }
    
    static func fetchAllUsers(completion: (users: [User]) -> Void) {
        
    }
    
    static func followUser(user: User, completion: (success: Bool) -> Void) {
        
    }
    
    static func unfollowUser(user: User, completion: (success: Bool) -> Void) {
        
    }
    
    static func userFollowsUser(user: User, followsUser: User, completion: (success: Bool) -> Void) {
        
    }
    
    static func followedByUser(user: User, completion: (success: Bool) -> Void) {
        
    }
    
    static func authenticateUser(email: String, password: String, bio: String?, url: String?, completion: (success: Bool) -> Void) {
        
    }
    
    static func createUser(email: String, username: String, password: String, bio: String?, url: String?, completion: (success: Bool) -> Void) {
        
    }
    
    static func updateUser(user: User, username: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        
    }
    
    static func logOutCurrentUser() {
        
    }
    
    static func mockUsers() -> [User] {
        
        let mockUserArray = [User(username: "User1", bio: nil, url: nil, identifier: nil),
                             User(username: "User2", bio: "Bio for user2", url: nil, identifier: "user2identifier"),
                             User(username: "User3", bio: nil, url: "www.google.com", identifier: nil),
                             User(username: "User4", bio: "Bio for user4", url: "www.reddit.com", identifier: "user4identifier")]
        return mockUserArray
    }
    
}






































