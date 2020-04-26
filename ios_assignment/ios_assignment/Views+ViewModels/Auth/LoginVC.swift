//
//  LoginVC.swift
//  ios_assignment
//
//  Created by Thanushka on 4/24/20.
//  Copyright © 2020 thanushka. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set facebook button
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        
    
    }

}
