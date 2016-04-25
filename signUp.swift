//
//  signUp.swift
//  PacficWay
//
//  Created by Aaron Ochoa on 3/30/16.
//  Copyright © 2016 Aaron Ochoa. All rights reserved.
//

import UIKit
import Foundation

class signUp: UIViewController {

    
    let APP_ID = "FAE21726-5A90-850A-FF05-A61BA47D6300"
    let SECRET_KEY = "3F7C7705-741B-9140-FF08-F88A8F1B5E00"
    let VERSION_NUM = "v1"
    

    @IBOutlet weak var userEmailAddressTextField: UITextField!
    @IBOutlet weak var userPasswordTextFeild: UITextField!
    @IBOutlet weak var userConfirmPasswordTextField: UITextField!
    
  
    var backendless = Backendless.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backendless.initApp(APP_ID, secret: SECRET_KEY, version: VERSION_NUM)
        
        registerUser()
        
    }
    
    var email: String? {
        get{
            return userEmailAddressTextField.text
        }
    }

    var password: String? {
        get{
            return userPasswordTextFeild.text
        }
    }
    
    var confirmPassword: String? {
        get{
            return userConfirmPasswordTextField.text
        }
    }
    
    @IBAction func logInButtonTapped(sender: AnyObject) {
     
        
    if ((email ?? "").isEmpty || (password ?? "").isEmpty || (confirmPassword ?? "").isEmpty)
    {
        let myAlert = UIAlertController(title:"Alert", message: "All fields are required to fill in", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title:"Ok",style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
        return
        }
        
        if (password != confirmPassword){
            let myAlert = UIAlertController(title:"Alert", message: "Passwords do not match. Please try again.", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title:"Ok",style: UIAlertActionStyle.Default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.presentViewController(myAlert, animated: true, completion: nil)
            
            return

                    }
        func validateEmail(candidate: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@apu.edu$"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluateWithObject(candidate)
        }
        
        if (validateEmail((email ?? "")) == false){
            let myAlert = UIAlertController(title:"Alert", message: "Not an APU email address. Please try again.", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title:"Ok",style: UIAlertActionStyle.Default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.presentViewController(myAlert, animated: true, completion: nil)
            
            return
        }
        
        
        registerUser()
                }
    
    
    
    func registerUser() {
        
        Types.tryblock({ () -> Void in
            
            let user = BackendlessUser()
            user.email = self.email
            user.password = self.password
            
            let registeredUser = self.backendless.userService.registering(user)
            print("User has been registered (SYNC): \(registeredUser)")
            },
                       
                       catchblock: { (exception) -> Void in
                        print("Server reported an error: \(exception)" )
        })
        return

        }
    
}










