//
//  AppDelegate.swift
//  MSChallenge-UIKit
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //Setting up to use App Delegate instead of Scene Delegate
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ViewController()
        
        //Basics
        window?.backgroundColor = UIColor.systemBackground
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

