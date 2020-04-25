//
//  AppDelegate.swift
//  ios_assignment
//
//  Created by Thanushka on 4/24/20.
//  Copyright © 2020 thanushka. All rights reserved.
//

 import UIKit
 import FBSDKLoginKit
 import FBSDKCoreKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //facebook configaration
        ApplicationDelegate.shared.application( application, didFinishLaunchingWithOptions: launchOptions)
        
        // set basic apperance of the app
        ConfigureService.shared.configure()
        
        // set root nevigetion
        ConfigureService.shared.manageUserDirection()
        
        return true
    }
    
//    func application(_ app: UIApplication,open url: URL,options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//
////        ApplicationDelegate.shared.application(
////            app,
////            open: url,
////            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
////            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
////        )
//
//    }

    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = ApplicationDelegate.shared.application(application, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?, annotation: options[UIApplication.OpenURLOptionsKey.annotation])

        ConfigureService.shared.fbLogPath()
        showHomePath()
        return handled
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
         // set basic apperance of the app
//               ConfigureService.shared.configure()
        

    }
    
    func applicationWillResignActive(_ application: UIApplication) {
//        AppEvents.activateApp()
    }
    // MARK: UISceneSession Lifecycle

//    @available(iOS 13.0, *)
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }

//    @available(iOS 13.0, *)
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//    

    
    func setAsRoot(_controller: UIViewController) {
        if window != nil {
            window?.rootViewController = _controller
        }
    }
    
    
    func showHomePath() {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = mainStoryBoard.instantiateViewController(withIdentifier: "MainNC") as! UINavigationController
        self.window?.rootViewController = homeVC
    }
}

