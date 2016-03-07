//
//  User.swift
//  Timeline
//
//  Created by Taylor Mott on 11/3/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

struct User: Equatable, FirebaseType {
    
    private let kUsernameKey = "username"
    private let kBioKey = "bio"
    private let kURLKey = "url"
    
    var username: String
    var bio: String?
    var url: String?
    var identifier: String?
    
    var endpoint: String {
        return "users"
    }
    
    var jsonValue: [String: AnyObject] {
        var json: [String: AnyObject] =  [kUsernameKey: username]
        
        if let bio = bio {
           json.updateValue(bio, forKey: kBioKey)
        }
        
        if let url = url {
            json.updateValue(url, forKey: kURLKey)
        }
        
        return json
    }
    
    init(username: String, uid: String, bio: String? = nil, url: String? = nil) {
        
        self.username = username
        self.bio = bio
        self.url = url
        self.identifier = uid
    }
    
    init?(json: [String : AnyObject], identifier: String) {
        guard let username = json[kUsernameKey] as? String else { return nil }
        
        self.username = username
        self.bio = jsonValue[kBioKey] as? String
        self.url = jsonValue[kURLKey] as? String
        self.identifier = identifier
        
    }
    
}

func ==(lhs: User, rhs: User) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}
