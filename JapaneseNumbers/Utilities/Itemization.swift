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
}

extension Itemized {

    var numberOfItems: Int { return items.count }

    func item(forCellAt indexPath: IndexPath) -> ItemType {
        return items[indexPath.row]
    }
}
