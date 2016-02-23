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
    
    let currentUser: User! = UserController.mockUsers()[0]
    

    
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        
        completion(user: mockUsers()[1])
    }
    
    static func fetchAllUsers(completion: (users: [User]) -> Void) {
        
        completion(users: mockUsers())
    }
    
    static func followUser(user: User, completion: (success: Bool) -> Void) {
        
        completion(success: true)
        
    }
    
    static func unfollowUser(user: User, completion: (success: Bool) -> Void) {
        
        completion(success: true)
    }
    
    static func userFollowsUser(user: User, followsUser: User, completion: (success: Bool) -> Void) {
        
        completion(success: true)
    }
    
    static func followedByUser(user: User, completion: (success: Bool) -> Void) {
        
        completion(success: true)
    }
    
    static func authenticateUser(email: String, password: String, bio: String?, url: String?, completion: (success: Bool) -> Void) {
        
        completion(success: true)
        
    }
    
    static func createUser(email: String, username: String, password: String, bio: String?, url: String?, completion: (success: Bool) -> Void) {
        
        completion(success: true)
    }
    
    static func updateUser(user: User, username: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        
        completion(success: true, user: mockUsers()[3])
    }
    
    static func logOutCurrentUser() {
        
    }
    
    static func mockUsers() -> [User] {
        
        let user1 = User(username: "User1", bio: nil, url: nil, identifier: nil)
        let user2 = User(username: "User2", bio: "Bio for user2", url: nil, identifier: "user2identifier")
        let user3 = User(username: "User3", bio: nil, url: "www.google.com", identifier: nil)
        let user4 = User(username: "User4", bio: "Bio for user4", url: "www.reddit.com", identifier: "user4identifier")
        
        let mockUserArray = [user1, user2, user3, user4]
        
        return mockUserArray
    }
    
}






































