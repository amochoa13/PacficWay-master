//
//  loginClass.swift
//  PacficWay
//
//  Created by Aaron Ochoa on 4/19/16.
//  Copyright © 2016 Aaron Ochoa. All rights reserved.
//

import UIKit

class loginClass: UIViewController {

    let APP_ID = "FAE21726-5A90-850A-FF05-A61BA47D6300"
    let SECRET_KEY = "3F7C7705-741B-9140-FF08-F88A8F1B5E00"
    let VERSION_NUM = "v1"
    
   /* @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    var backendless = Backendless.sharedInstance()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    var email: String? {
        get{
            return userEmail.text
        }
    }
    
    var password: String? {
        get{
            return userPassword.text
    
    }

    
    
    @IBAction func enterButtonPressed(sender: AnyObject) {
        
        
    }
    
    func login(login: String!,
               password: String!){
         BackendlessUser!.self}

    func login(login: String!,
                 password: String!,
                 error fault: AutoreleasingUnsafeMutablePointer<Fault?>){ BackendlessUser!.self}
    func loginUser() {
        
        Types.tryblock({ () -> Void in
            
            let user = self.backendless.userService.login(email, password: password)
            print("User has been logged in (SYNC): \(user)")
            },
                       
                       catchblock: { (exception) -> Void in
                        print("Server reported an error: \(exception as! Fault)")
        })
    } */
}
