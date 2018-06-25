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
        navigationController?.isNavigationBarHidden = true
        startIndicatingActivity()
        model?.fetchItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

extension JapaneseNumbersViewController: ActivityIndicableView {}

extension JapaneseNumbersViewController: ModelConfigurable {}
