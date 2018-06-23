//
//  JapaneseNumbersView.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

final class JapaneseNumbersView: CustomView {

    private(set) weak var tableView: UITableView!
    let tableViewDataSourceAndDelegate = JapaneseNumbersTableViewDataSourceAndDelegate()

    // MARK: - Adding Subviews

    override func addSubviews() {
        let tableView = UITableView(frame: .zero)

        tableView.dataSource = tableViewDataSourceAndDelegate
        tableView.delegate = tableViewDataSourceAndDelegate
        tableView.rowHeight = 80

        tableView.register(JapaneseNumberCell.self)

        addSubview(tableView)

        self.tableView = tableView
    }

    // MARK: - Making Constraints

    override func makeConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([.bottom, .left, .right, .top].map {
            .init(
                item: tableView,
                attribute: $0,
                relatedBy: .equal,
                toItem: tableView.superview,
                attribute: $0,
                multiplier: 1,
                constant: 0)
        })
    }
}

extension JapaneseNumbersView: ModelConfigurable {

    var model: JapaneseNumbersViewModel? { return tableViewDataSourceAndDelegate.model }

    func configure(with model: JapaneseNumbersViewModel) {
        model.onItemsFetched = { [unowned self] in self.tableView.reloadData() }
        tableViewDataSourceAndDelegate.configure(with: model)
    }
}
