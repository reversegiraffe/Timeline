//
//  ProfileHeaderCollectionReusableView.swift
//  Timeline
//
//  Created by Kaytee on 2/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    
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
        
        
    }
}
