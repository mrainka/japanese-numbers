//
//  JapaneseNumbersTableViewDataSourceAndDelegate.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

final class JapaneseNumbersTableViewDataSourceAndDelegate: NSObject {}

extension JapaneseNumbersTableViewDataSourceAndDelegate: UITableViewDelegate {}

extension JapaneseNumbersTableViewDataSourceAndDelegate: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return .init()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
