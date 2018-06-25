//
//  DetailableJapaneseNumbersViewController.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 24/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

final class DetailableJapaneseNumbersViewController: UISplitViewController {

    private(set) var model: DetailableJapaneseNumbersViewModel?

    private(set) weak var listView: JapaneseNumbersViewController!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        addListView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addListView() {
        let listView = JapaneseNumbersViewController()
        viewControllers = [UINavigationController(rootViewController: listView)]
        self.listView = listView
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: nil) { [unowned self] _ in
            self.model?.selectFirstItemIfNotCollapsedAndNothingIsSelected()
        }
    }
}

extension DetailableJapaneseNumbersViewController: ModelConfigurable {

    func configure(with model: DetailableJapaneseNumbersViewModel) {
        model.isCollapsed = { [unowned self] in self.isCollapsed }

        model.onOpenDetailRequested = { [unowned self] in
            let detailView = IndividualJapaneseNumberViewController()
            detailView.configure(with: $0)
            self.showDetailViewController(detailView, sender: self)
        }

        self.model = model

        listView.configure(with: model.list)
    }
}

extension DetailableJapaneseNumbersViewController: UISplitViewControllerDelegate {

    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController)
            -> Bool
    {
        return true
    }
}
