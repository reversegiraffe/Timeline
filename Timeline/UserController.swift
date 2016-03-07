//
//  UserController.swift
//  Timeline
//
//  Created by Taylor Mott on 11/3/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class UserController {
    
    private let kUserKey = "user"
    
    
    var currentUser: User! {
        
        get {
            
            guard let uid = FirebaseController.base.authData?.uid,
                let userDictionary = NSUserDefaults.standardUserDefaults().valueForKey(kUserKey) as? [String: AnyObject] else {
                    return nil
            }
            
            return User(json: userDictionary, identifier: uid)
        }
        
        set {
            
            if let newValue = newValue {
                NSUserDefaults.standardUserDefaults().setValue(newValue.jsonValue, forKey: kUserKey)
                NSUserDefaults.standardUserDefaults().synchronize()
            } else {
                NSUserDefaults.standardUserDefaults().removeObjectForKey(kUserKey)
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    }
    
    static let sharedController = UserController()
    
    static func userForIdentifier(identifier: String, completion: (users: [User]) -> Void) {
        
        FirebaseController.dataAtEndpoint("user/\(identifier)") { (data) -> Void in
            
            if let json = data as? [String: AnyObject] {
                let users = json.flatMap({User(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
                
                completion(users: users)
            } else {
                completion(users: [])
            }
        }
    }
    
    static func fetchAllUsers(completion: (users: [User]) -> Void) {
        
        FirebaseController.dataAtEndpoint("users") { (data) -> Void in
            
            if let json = data as? [String: AnyObject] {
                
                let users = json.flatMap({User(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
                
                completion(users: users)
            } else {
                completion(users: [])
            }
        }
    }
    
    static func followUser(user: User, completion: (success: Bool) -> Void) {
        
        FirebaseController.base.childByAppendingPath("/users/\(sharedController.currentUser.identifier!)/follows/\(user.identifier!)").removeValue()
        
        completion(success: true)
    }
    
    static func unfollowUser(user: User, completion: (success: Bool) -> Void) {
        
        FirebaseController.base.childByAppendingPath("users/\(sharedController.currentUser.identifier!)/follows/\(user.identifier!)").removeValue()
        
        completion(success: true)
    }
    
    static func userFollowsUser(user: User, followsUser: User, completion: (follows: Bool) -> Void ) {
       
        completion(follows: true)
    }
    
    static func followedByUser(user: User, completion: (followed: [User]?) -> Void) {
        
        completion(followed: [mockUsers()[1], mockUsers()[0]])
    }
    
    static func authenticateUser(email: String, password: String, completion: (success: Bool, user: User?) -> Void) {
        
        completion(success: true, user: mockUsers().first)
    }
    
    static func createUser(email: String, username: String, password: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        
        
        completion(success: true, user: mockUsers().first)
    }
    
    static func updateUser(user: User, username: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
     
        completion(success: true, user: mockUsers().first)
    }
    
    static func logoutCurrentUser() {
       UserController.sharedController.currentUser = nil
    }
    
    static func mockUsers() -> [User] {
        
        let user1 = User(username: "hansolo", uid: "1234")
        let user2 = User(username: "ob1kenob", uid: "2356")
        let user3 = User(username: "3po", uid: "3456")
        let user4 = User(username: "leia", uid: "4567", bio: "Princess", url: "myspace.com")
        
        return [user1, user2, user3, user4]
    }
}
