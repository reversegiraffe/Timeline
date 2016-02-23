//
//  PostController.swift
//  Timeline
//
//  Created by Kaytee on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    static func fetchTimelineForUser(user: User, completion: (posts: [Post]) -> Void) {
        
        completion(posts: mockPosts())
    }
    
    static func addPost(image: UIImage, caption: String?, completion: (success: Bool, post: Post?) -> Void) {
        
        completion(success: true, post: mockPosts()[0])
    }
    
    static func postFromIdentifier(identifier: String, completion: (post: Post?) -> Void) {
        
        completion(post: mockPosts()[1])
    }
    
    static func postsForUser(user: User, completion: (posts: [Post]) -> Void) {
        
        completion(posts: mockPosts())
    }
    
    static func deletePost(post: Post) {
        
    }
    
    static func addCommentWithTextToPost(text: String, post: Post, completion: (success: Bool, post: Post?) -> Void) {
        
        completion(success: true, post: mockPosts()[1])
    }
    
    static func deleteComment(comment: Comment, completion: (success: Bool) -> Void) {
        
        completion(success: true)
    }
    
    static func addLikeToPost(post: Post, completion: (success: Bool, post: Post?) -> Void) {
        
        completion(success: true, post: mockPosts()[2])
    }
    
    static func deleteLike(like: Like, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts()[1])
    }
    
    static func orderPosts(posts: [Post]) -> [Post] {
        return []
    }
    
    static func mockPosts() -> [Post] {
        
        let mockComments1: [Comment] = [Comment(username: "user1", text: "comment1", postIdentifier: "post1", identifier: nil), Comment(username: "user2", text: "comment2", postIdentifier: "post1", identifier: nil)]
        
        let mockLikes: [Like] = [Like(username: "user1", postIdentifier: "post1", identifier: nil), Like(username: "user2", postIdentifier: "post1", identifier: nil)]
        
        let post1 = Post(imageEndPoint: "post1EndPoint", caption: nil, username: "user1", comments: mockComments1, likes: [], identifier: nil)
        
        let post2 = Post(imageEndPoint: "post2EndPoint", caption: "caption2", username: "user1", comments: [], likes: mockLikes, identifier: "identifier2")
        
        let post3 = Post(imageEndPoint: "post2EndPoint", caption: "caption3", username: "user2", comments: mockComments1, likes: mockLikes, identifier: "identifier3")
        
        let mockPostsArray = [post1, post2, post3]
        
        return mockPostsArray
    }
}


































