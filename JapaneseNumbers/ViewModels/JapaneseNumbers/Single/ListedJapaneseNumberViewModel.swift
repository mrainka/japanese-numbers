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

    let name: String

    init(_ number: ListedJapaneseNumber) {
        imageURL = number.imageURL
        label = number.name

        name = number.name
    }
}

extension ListedJapaneseNumberViewModel: CellReuseIdentifiable {}

extension ListedJapaneseNumberViewModel: Equatable {

    static func == (lhs: ListedJapaneseNumberViewModel, rhs: ListedJapaneseNumberViewModel) -> Bool {
        return lhs.name == rhs.name
    }
}

extension ListedJapaneseNumberViewModel: JapaneseNumberViewModel {}
