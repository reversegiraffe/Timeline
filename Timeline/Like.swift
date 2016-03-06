//
//  Like.swift
//  Timeline
//
//  Created by Taylor Mott on 11/3/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

struct Like: FirebaseType {
    
    private let kPostKey = "post"
    private let kUsernameKey = "username"
    
    let username: String
    let postIdentifier: String
    var identifier: String?
    var endpoint: String {
        return "/posts/\(self.postIdentifier)/likes"
    }
    var jsonValue: [String: AnyObject] {
        return [kPostKey: postIdentifier, kUsernameKey: username]
    }
    
    init?(json: [String : AnyObject], identifier: String) {
        guard let postIdentifier = json[kPostKey] as? String,
            let username = json[kUsernameKey] as? String else { return nil }
        
        self.postIdentifier = postIdentifier
        self.username = username
        self.identifier = identifier
    }
    
    init(username: String, postIdentifier: String, identifier: String? = nil) {
        
        self.username = username
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
    
}

func ==(lhs: Like, rhs: Like) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}
