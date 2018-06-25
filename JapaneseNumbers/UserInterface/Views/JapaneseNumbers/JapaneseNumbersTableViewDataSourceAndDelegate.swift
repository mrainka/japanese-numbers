//
//  JapaneseNumbersTableViewDataSourceAndDelegate.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

final class JapaneseNumbersTableViewDataSourceAndDelegate: NSObject {

    private(set) var model: JapaneseNumbersViewModel?
}

extension JapaneseNumbersTableViewDataSourceAndDelegate: ModelConfigurable {

    func configure(with model: JapaneseNumbersViewModel) {
        self.model = model
    }
}

extension JapaneseNumbersTableViewDataSourceAndDelegate: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model?.selectItem(forCellAt: indexPath)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let item = model?.item(forCellAt: indexPath) else { return }
        cell.configureIfPossible(with: item)
    }

    // MARK: Highlighting Row

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isHighlighted = true
    }

    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isHighlighted = false
    }
}

extension JapaneseNumbersTableViewDataSourceAndDelegate: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = model?.item(forCellAt: indexPath) else { return .init() }
        return tableView.dequeueReusableCell(with: item, for: indexPath)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.numberOfItems ?? 0
    }
}
