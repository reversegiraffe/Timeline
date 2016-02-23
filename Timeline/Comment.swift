//
//  Comment.swift
//  Timeline
//
//  Created by Kaytee on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Comment: Equatable {
    
    let username: String
    let text: String
    let postIdentifier: String
    let identifier: String? = nil
    
    init(username: String, text: String, postIdentifier: String, identifier: String?){
        
        self.username = username
        self.text = text
        self.postIdentifier = postIdentifier
    }
}

func ==(lhs: Comment, rhs: Comment) -> Bool {
    
    return lhs.username == rhs.username && lhs.identifier == rhs.identifier
}