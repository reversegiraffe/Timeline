//
//  ProfileHeaderCollectionReusableView.swift
//  Timeline
//
//  Created by Kaytee on 2/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

protocol ProfileHeaderCollectionReusableViewDelegate {
    
    func userTappedFollowActionButton()
    func userTappedURLButton()
}

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    
    var delegate: ProfileHeaderCollectionReusableViewDelegate?
    
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var homePageButton: UIButton!
    
    func updateWithUser(user: User) {
        
        if let bio = user.bio {
            bioLabel.text = bio
        } else {
            bioLabel.hidden = true
        }
        
        if let homePage = user.url {
            homePageButton.setTitle("\(homePage)", forState: .Normal)
        } else {
            homePageButton.hidden = true
        }
        
        if user == UserController.sharedController.currentUser {
            followButton.setTitle("Log out", forState: .Normal)
        } else {
            UserController.userFollowsUser(UserController.sharedController.currentUser, followsUser: user, completion: { (success) -> Void in
                if success {
                    self.followButton.setTitle("Unfollow", forState: .Normal)
                } else {
                    self.followButton.setTitle("Follow", forState: .Normal)
                }
            })
        }
        
    }
    
    @IBAction func followActionButtonTapped(sender: AnyObject) {
        delegate?.userTappedFollowActionButton()
    }

    @IBAction func urlButtonTapped(sender: AnyObject) {
        delegate?.userTappedURLButton()
    }
}
