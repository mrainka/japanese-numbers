//
//  CellConfiguration.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

extension UITableViewCell {

    func configureIfPossible(with model: CellReuseIdentifiable) {
        switch (self, model) {
        case let (cell, model) as (JapaneseNumberCell, JapaneseNumberCell.ModelType):
            cell.configure(with: model)
        default:
            break
        }
    }
}
