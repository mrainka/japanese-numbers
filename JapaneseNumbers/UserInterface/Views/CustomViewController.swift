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

    var onCustomViewLoaded: (() -> Void)?

    override func loadView() {
        let customView = CustomViewType(frame: .zero)
        view = customView
        self.customView = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        onCustomViewLoaded?()
    }
}

extension CustomViewController: CustomViewContainer {

    var isCustomViewLoaded: Bool { return isViewLoaded }
}
