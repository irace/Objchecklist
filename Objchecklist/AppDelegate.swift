//
//  AppDelegate.swift
//  Objchecklist
//
//  Created by Bryan Irace on 11/15/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

import UIKit

// Alternative name: `Cocoamplete`?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    var window: UIWindow?

    // MARK: - UIApplicationDelegate
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [UINavigationController(rootViewController: MasterViewController())/*, IssueViewController(issue: Issue(title: "", permalink: NSURL(), articles: []))*/]
        splitViewController.delegate = self
        
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible();
        
        return true
    }
    
    // MARK: - Split view

//    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController!, ontoPrimaryViewController primaryViewController:UIViewController!) -> Bool {
//        if let secondaryAsNavController = secondaryViewController as? UINavigationController {
//            if let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController {
//                if topAsDetailController.detailItem == nil {
//                    // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
//                    return true
//                }
//            }
//        }
//        return false
//    }

}

