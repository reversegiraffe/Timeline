//
//  LoginSignupViewController.swift
//  Timeline
//
//  Created by Kaytee on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    var mode: ViewMode = .Signup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewBasedOnMode()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViewBasedOnMode() {
        
        switch mode {
            
        case .Signup: emailTextField.hidden = false;
                      bioTextField.hidden = false;
                      urlTextField.hidden = false;
                      actionButton.titleLabel?.text = "Sign Up"
            
        case .Login: emailTextField.hidden = true;
                     bioTextField.hidden = true;
                     urlTextField.hidden = true
                     actionButton.titleLabel?.text = "Log In"
            
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

enum ViewMode {
    case Login, Signup
}
