//
//  ListedJapaneseNumberViewModel.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import Foundation

struct ListedJapaneseNumberViewModel {

    static let cellReuseIdentifier = "JapaneseNumberCell"

    let imageURL: URL?
    let label: String

    init(_ number: ListedJapaneseNumber) {
        imageURL = number.imageURL
        label = number.name
    }
}

extension ListedJapaneseNumberViewModel: CellReuseIdentifiable {}
