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
        window.rootViewController = type(of: self).rootView()
        window.makeKeyAndVisible()
        self.window = window
    }

    private static func rootView() -> UIViewController {
        let rootView = PortraitCompactHorizontalSizeKeeper()
        let detailableJapaneseNumbersView = DetailableJapaneseNumbersViewController()
        detailableJapaneseNumbersView.configure(with: .init())
        rootView.add(detailableJapaneseNumbersView)
        return rootView
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
