//
//  CellDequeuingAndRegistration.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

extension UITableView {

    func dequeueReusableCell(with item: CellReuseIdentifiable, for indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: type(of: item).cellReuseIdentifier, for: indexPath)
    }

    func register<CellType: UITableViewCell>(_ cellClass: CellType.Type)
        where CellType: ModelConfigurable, CellType.ModelType: CellReuseIdentifiable
    {
        register(cellClass, forCellReuseIdentifier: CellType.ModelType.cellReuseIdentifier)
    }
}
