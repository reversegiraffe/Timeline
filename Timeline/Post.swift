//
//  Post.swift
//  Timeline
//
//  Created by Taylor Mott on 11/3/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

struct Post: Equatable, FirebaseType {
    
    private let kUsernameKey = "username"
    private let kImageEndpointKey = "imageEndpoint"
    private let kCaptionKey = "caption"
    private let kCommentsKey = "comments"
    private let kLikesKey = "likes"
    
    let imageEndpoint: String
    let caption: String?
    let username: String
    let comments: [Comment]
    let likes: [Like]
    var identifier: String?
    var endpoint: String {
        return "posts"
    }
    var jsonValue: [String: AnyObject] {
        var json: [String: AnyObject] = [kUsernameKey: username, kImageEndpointKey: imageEndpoint, kCommentsKey: comments.map({$0.jsonValue}), kLikesKey: likes.map({$0.jsonValue})]
        
        if let caption = caption {
            json.updateValue(caption, forKey: kCaptionKey)
        }
        
        return json
    }
    
    init?(json: [String : AnyObject], identifier: String) {
        guard let username = json[kUsernameKey] as? String,
            let imageEndpoint = json[kImageEndpointKey] as? String else { return nil }
        
        self.caption = json[kCaptionKey] as? String
        self.imageEndpoint = imageEndpoint
        self.username = username
        self.identifier = identifier
        
        if let commentDictionaries = json[kCommentsKey] as? [String: AnyObject] {
            self.comments = commentDictionaries.flatMap({Comment(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
        } else {
            self.comments = []
        }
        
        if let likeDictionaries = json[kLikesKey] as? [String: AnyObject] {
            self.likes = likeDictionaries.flatMap({Like(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
        } else {
            self.likes = []
        }
    }
    
    init(imageEndpoint: String, caption: String?, username: String = "", comments: [Comment] = [], likes: [Like] = [], identifier: String? = nil) {
        
        self.imageEndpoint = imageEndpoint
        self.caption = caption
        self.username = username
        self.comments = comments
        self.likes = likes
    }
    
}

func ==(lhs: Post, rhs: Post) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}


















