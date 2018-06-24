//
//  IndividualJapaneseNumberViewController.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 24/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

final class IndividualJapaneseNumberViewController: CustomViewController<IndividualJapaneseNumberView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        startIndicatingActivity()
        model?.fetchData()
    }
}

extension IndividualJapaneseNumberViewController: ActivityIndicableView {}

extension IndividualJapaneseNumberViewController: ModelConfigurable {}
