//
//  Comment.swift
//  Timeline
//
//  Created by Taylor Mott on 11/3/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

struct Comment: Equatable, FirebaseType {
    
    private let kPostKey = "post"
    private let kUsernameKey = "username"
    private let kTextKey = "text"
    
    let username: String
    let text: String
    let postIdentifier: String
    var identifier: String?
    var endpoint: String {
        return "/posts/\(postIdentifier)/comments"
    }
    var jsonValue: [String: AnyObject] {
        return [kPostKey: postIdentifier, kUsernameKey: username, kTextKey: text]
    }
    
    init?(json: [String : AnyObject], identifier: String) {
        guard let postIdentifier = json[kPostKey] as? String,
            let username = json[kUsernameKey] as? String,
            let text = json[kTextKey] as? String else { return nil }
        
        self.postIdentifier = postIdentifier
        self.username = username
        self.text = text
        self.identifier = identifier
        
    }
    
    init(username: String, text: String, postIdentifier: String, identifier: String? = nil) {
        
        self.username = username
        self.text = text
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
    
}

func ==(lhs: Comment, rhs: Comment) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}
