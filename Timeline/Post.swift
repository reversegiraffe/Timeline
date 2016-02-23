//
//  Post.swift
//  Timeline
//
//  Created by Kaytee on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Post: Equatable {
    
    let imageEndPoint: String
    let caption: String? = nil
    let username: String
    let comments: [Comment] = []
    let likes: [Like] = []
    let identifier: String? = nil

    init(imageEndPoint: String, caption: String?, username: String, comments: [Comment], likes: [Like], identifier: String?) {
        self.imageEndPoint = imageEndPoint
        self.username = username
    }

}

func ==(lhs: Post, rhs: Post) -> Bool {
    
    return lhs.username == rhs.username && lhs.identifier == rhs.identifier
}