//
//  Configure.swift
//  ios_assignment
//
//  Created by Thanushka on 4/24/20.
//  Copyright © 2020 thanushka. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

enum Storyboard: String {
    case Auth
    case Main
}

class ConfigureService {
    
       static let shared = ConfigureService()

       let bundleId = Bundle.main.bundleIdentifier ?? ""
       let deviceId = UIDevice.current.identifierForVendor!.uuidString
       let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
       let deviceType = "APPLE"

       
       private init() {}
       
       func configure() {
           // set common app appearance
           manageUIAppearance()
       }
       
       // Setup application appearance
       private func manageUIAppearance() {
           
           UINavigationBar.appearance().barTintColor = UIColor(red: 37/255.0, green: 160.0/255.0, blue: 162.0/255.0, alpha: 1.0)

           // Set navigation title color to white
           UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
       }
    
    // fucntion to handle User Direction
       public func manageUserDirection(from vc: UIViewController? = nil, window: UIWindow? = nil ) {
        
       //check face book tacken is expierd  or not
       if let token = AccessToken.current,
           !token.isExpired {
            directToPath(in: .Main, for: "MainNC", from: vc, window: window)
            return
       }
        directToPath(in: .Auth, for: "AuthVC", from: vc, window: window)

       }
    
    func fbLogPath()  {
        directToPath(in: .Main, for: "MainNC")
    }
       
    // Direct to Main Root window
       public func directToPath(in sb: Storyboard, for identifier: String, from vc: UIViewController? = nil, window: UIWindow? = nil) {
           let storyboard = UIStoryboard(name: sb.rawValue, bundle: nil)
           let topController = storyboard.instantiateViewController(withIdentifier: identifier)
           
           appDelegate.setAsRoot(_controller: topController)
       }
}
