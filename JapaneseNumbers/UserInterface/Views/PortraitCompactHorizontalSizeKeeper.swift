//
//  PortraitCompactHorizontalSizeKeeper.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 25/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

final class PortraitCompactHorizontalSizeKeeper: UIViewController {

    func add(_ view: UIViewController) {
        addChildViewController(view)

        self.view.addSubview(view.view)

        view.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([.bottom, .left, .right, .top].map {
            .init(
                item: view.view,
                attribute: $0,
                relatedBy: .equal,
                toItem: view.view.superview,
                attribute: $0,
                multiplier: 1,
                constant: 0)
        })

        view.didMove(toParentViewController: self)
    }

    private func setOverrideHorizontalSizeClassForChildViewControllers() {
        let isPortrait = UIDevice.current.orientation.isPortrait
        let traitCollection
            = UITraitCollection(horizontalSizeClass: isPortrait ? .compact : self.traitCollection.horizontalSizeClass)
        childViewControllers.forEach { setOverrideTraitCollection(traitCollection, forChildViewController: $0) }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setOverrideHorizontalSizeClassForChildViewControllers()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        setOverrideHorizontalSizeClassForChildViewControllers()
        super.viewWillTransition(to: size, with: coordinator)
    }
}
