//
//  ProfileViewController.swift
//  Timeline
//
//  Created by Kaytee on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import SafariServices

class ProfileViewController: UIViewController, UICollectionViewDataSource, ProfileHeaderCollectionReusableViewDelegate {

    @IBOutlet weak var editBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    var user: User?
    
    var userPosts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if user == nil {
            user = UserController.sharedController.currentUser
            editBarButtonItem.enabled = true
        }
        
        
       

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateBasedOnUser() {
        
        guard let user = user else { return }
        
        title = user.username
        
        PostController.postsForUser(user) { (posts) -> Void in
            
            self.userPosts = posts
            self.collectionView.reloadData()
    
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return userPosts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        
        let post = userPosts[indexPath.item]
        
        cell.updateWithImageIdentifier(post.imageEndPoint)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headerCell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "profileHeaderView", forIndexPath: indexPath) as! ProfileHeaderCollectionReusableView
        
        headerCell.updateWithUser(user!)
        headerCell.delegate = self
        
        return headerCell
    }
    
    func userTappedURLButton() {
        
        if let userURL = NSURL(string: (user?.url)!) {
            
            let safariViewController = SFSafariViewController(URL: userURL)
            presentViewController(safariViewController, animated: true, completion: nil)
        }
        
    }
    
    func userTappedFollowActionButton() {
        
        guard let user = user else { return }
        
        UserController.userFollowsUser(UserController.sharedController.currentUser, followsUser: user) { (success) -> Void in
            
            if success {
                UserController.unfollowUser(self.user!, completion: { (success) -> Void in
                    self.updateBasedOnUser()
                })
            } else {
                UserController.followUser(self.user!, completion: { (success) -> Void in
                    self.updateBasedOnUser()
                })
            }
        }
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toEditProfile" {
            
            if let destinationViewController = segue.destinationViewController as? LoginSignupViewController {
                destinationViewController.updateWithUser(user!)
            }
            
            
        }
        
        
    }

    
    

}


































