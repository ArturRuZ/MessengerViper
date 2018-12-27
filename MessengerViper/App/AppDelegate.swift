//
//  AppDelegate.swift
//  MessengerViper
//
//  Created by Krasa on 22/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var app: Application?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        app = Application()
        app?.SingleChat()
        window?.rootViewController = app?.fire()
        window?.makeKeyAndVisible()
        return true
    }
}

