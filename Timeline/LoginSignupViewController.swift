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
    }

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
            
        case .Signup: usernameTextField.hidden = false;
                      bioTextField.hidden = false;
                      urlTextField.hidden = false;
                      actionButton.titleLabel?.text = "Sign Up"
            
        case .Login: usernameTextField.hidden = true;
                     bioTextField.hidden = true;
                     urlTextField.hidden = true
                     actionButton.titleLabel?.text = "Log In"
            
        }
        
        
    }
    
    
    @IBAction func actionButtonTapped(sender: AnyObject) {
        
        
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


