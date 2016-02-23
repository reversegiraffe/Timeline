//
//  User.swift
//  Timeline
//
//  Created by Kaytee on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct User: Equatable {
    
    let username: String
    let bio: String? = nil
    let url: String? = nil
    let identifier: String?
    
    init(username: String, bio: String?, url: String?, identifier: String?) {
        self.username = username
        self.identifier = identifier
    }
    
    
}

func ==(lhs: User, rhs: User) -> Bool {
 
    return lhs.username == rhs.username && lhs.identifier == rhs.identifier
    
}