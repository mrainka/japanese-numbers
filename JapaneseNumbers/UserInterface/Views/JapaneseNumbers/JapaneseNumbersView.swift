//
//  JapaneseNumbersView.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

final class JapaneseNumbersView: CustomView {

    // MARK: - Subviews

    private(set) weak var activityIndicatorView: UIActivityIndicatorView!

    private(set) weak var tableView: UITableView!
    let tableViewDataSourceAndDelegate = JapaneseNumbersTableViewDataSourceAndDelegate()

    // MARK: - Adding Subviews

    override func addSubviews() {
        addTableView()
        activityIndicatorView = addActivityIndicatorView()
    }

    private func addTableView() {
        let tableView = UITableView(frame: .zero)

        tableView.backgroundColor = .veryLightGray
        tableView.dataSource = tableViewDataSourceAndDelegate
        tableView.delegate = tableViewDataSourceAndDelegate
        tableView.rowHeight = 80
        tableView.separatorColor = .gray

        tableView.register(JapaneseNumberCell.self)

        addSubview(tableView)

        self.tableView = tableView
    }

    // MARK: - Making Constraints

    override func makeConstraints() {
        makeConstraintsForActivityIndicatorView()
        makeConstraintsForTableView()
    }

    private func makeConstraintsForTableView() {
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

extension JapaneseNumbersView: ActivityIndicableView {}

extension JapaneseNumbersView: ModelConfigurable {

    var model: JapaneseNumbersViewModel? { return tableViewDataSourceAndDelegate.model }

    func configure(with model: JapaneseNumbersViewModel) {
        model.onItemSelected.append { [unowned self] in
            self.tableView.selectRow(at: self.model?.indexPath(ofCellFor: $0), animated: false, scrollPosition: .none)
        }

        model.onItemsFetched = { [weak self] in
            guard let `self` = self else { return }
            self.stopIndicatingActivity()
            self.tableView.reloadData()
            self.model?.onItemsShowed?()
        }

        tableViewDataSourceAndDelegate.configure(with: model)
    }
}
