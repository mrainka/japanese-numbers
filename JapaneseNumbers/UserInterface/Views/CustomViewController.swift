//
//  CustomViewController.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

class CustomViewController<CustomViewType: UIView>: UIViewController {

    private(set) weak var customView: CustomViewType!

    override func loadView() {
        let customView = CustomViewType(frame: .zero)
        view = customView
        self.customView = customView
    }
}

extension CustomViewController: CustomViewContainer {}
