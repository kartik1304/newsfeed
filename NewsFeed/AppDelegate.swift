//
//  AppDelegate.swift
//  NewsFeed
//
//  Created by iMac on 27/06/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK: - Variable
    var navVC : UINavigationController?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpViewController()
        return true
    }
    
    //MARK: - Set up root viewcontroller
    func setUpViewController() {
        if let vc = STORYBOARD.Main.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            self.navVC = UINavigationController(rootViewController: vc)
            self.navVC?.isNavigationBarHidden = true
            self.navVC?.interactivePopGestureRecognizer?.isEnabled = false
            self.navVC?.interactivePopGestureRecognizer?.delegate = nil
            self.window?.rootViewController = nil
            self.window?.rootViewController = navVC
            self.window?.makeKeyAndVisible()
        }
    }

}

