//
//  Itemization.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import Foundation

protocol Itemized {

    associatedtype ItemType

    var items: [ItemType] { get }

    var isItemSelected: Bool { get }
    var onItemSelected: [((ItemType) -> Void)] { get set }

    func select(_ item: ItemType)
}

extension Itemized {

    var numberOfItems: Int { return items.count }

    func item(forCellAt indexPath: IndexPath) -> ItemType {
        return items[indexPath.row]
    }

    // MARK: - Selecting Items

    func selectFirstItem() {
        guard let item = items.first else { return }
        select(item)
    }

    func selectItem(forCellAt indexPath: IndexPath) {
        select(item(forCellAt: indexPath))
    }
}

extension Itemized where ItemType: Equatable {

    func indexPath(ofCellFor item: ItemType) -> IndexPath? {
        guard let row = items.index(of: item) else { return nil }
        return .init(row: row, section: 0)
    }
}
