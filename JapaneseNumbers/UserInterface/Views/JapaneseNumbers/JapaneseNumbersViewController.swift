//
//  JapaneseNumbersViewController.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 22/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

final class JapaneseNumbersViewController: CustomViewController<JapaneseNumbersView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.activityIndicatorView.startAnimating()
        model?.fetchItems()
    }
}

extension JapaneseNumbersViewController: ModelConfigurable {}
