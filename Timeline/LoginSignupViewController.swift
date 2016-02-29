//
//  LoginSignupViewController.swift
//  Timeline
//
//  Created by Kaytee on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {
    
    enum ViewMode {
        case Login
        case Signup
        case Edit
    }
    
    var user: User?

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    var fieldsAreValid: Bool {
        get {
            switch mode {
            case .Signup:
                return !(usernameTextField.text == nil || emailTextField.text == nil || passwordTextField.text == nil)
                
            case .Login:
                return !(emailTextField.text == nil || passwordTextField.text == nil)
                
            case .Edit:
                return !(usernameTextField.text == nil)
            }
            
            
        }
    }
    
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
            
        case .Signup:
                      actionButton.setTitle("Sign Up", forState: .Normal)
            
        case .Login: usernameTextField.hidden = true
                     bioTextField.hidden = true
                     urlTextField.hidden = true
        
                     actionButton.setTitle("Log In", forState: .Normal)
            
        case .Edit: actionButton.setTitle("Update", forState: .Normal)
            
                    emailTextField.hidden = true
                    passwordTextField.hidden = true
            
                    if let user = self.user {
                        
                        usernameTextField.text = user.username
                        bioTextField.text = user.bio
                        urlTextField.text = user.url
                    }
            
        }
        
        
    }
    
    
    @IBAction func actionButtonTapped(sender: AnyObject) {
        
        if fieldsAreValid {
            switch mode {
                
            case .Signup: UserController.createUser(emailTextField.text!, username: usernameTextField.text!, password: passwordTextField.text!, bio: bioTextField.text, url: urlTextField.text, completion: { (success, user) -> Void in
                
                if success, let _ = user {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    self.presentValidationAlertWithTitle("Sign up unsuccessful", message: "Please try again.")
                }
            })
            case .Login: UserController.authenticateUser(emailTextField.text!, password: passwordTextField.text!, bio: bioTextField.text, url: urlTextField.text, completion: { (success, user) -> Void in
                
                if success, let _ = user {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    self.presentValidationAlertWithTitle("Log in unsuccessful", message: "Please try again.")
                }
            })
            case .Edit: UserController.updateUser(user!, username: usernameTextField.text!, bio: bioTextField.text, url: urlTextField.text, completion: { (success, user) -> Void in
                
                if success {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    self.presentValidationAlertWithTitle("Unable to update user", message: "Please try again.")
                }
            })
                
            }
        }
    }
    
    func updateWithUser(user: User) {
        self.user = user
        mode = .Edit
    }
    
    func presentValidationAlertWithTitle(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
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


