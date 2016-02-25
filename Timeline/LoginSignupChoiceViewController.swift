//
//  LoginSignupChoiceViewController.swift
//  Timeline
//
//  Created by Kaytee on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LoginSignupChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toSignup" {
            
            let destinationContoller = segue.destinationViewController as? LoginSignupViewController
            destinationContoller?.mode = LoginSignupViewController.ViewMode.Signup

        }
        
        if segue.identifier == "toLogin" {
            
            let destinationController = segue.destinationViewController as? LoginSignupViewController
            destinationController?.mode = LoginSignupViewController.ViewMode.Login
        }
    }
    

}
