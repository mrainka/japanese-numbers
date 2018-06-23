//
//  AppDelegate.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 22/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {

    var window: UIWindow?

    private func addWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let rootView = JapaneseNumbersViewController()
        rootView.configure(with: .init())
        window.rootViewController = rootView
        window.makeKeyAndVisible()
        self.window = window
    }
}

extension AppDelegate: UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil)
            -> Bool
    {
        addWindow()
        return true
    }
}
