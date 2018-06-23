//
//  JapaneseNumberCell.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

final class JapaneseNumberCell: CustomTableViewCell<ListedJapaneseNumberView> {

    override class var inset: UIEdgeInsets { return .init(top: 8, left: 16, bottom: 8, right: 16) }
}

extension JapaneseNumberCell: ModelConfigurable {}
