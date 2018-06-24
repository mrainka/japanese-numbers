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

    override var isHighlighted: Bool {
        didSet {
            selectedBackgroundView?.backgroundColor = isHighlighted ? .blue : type(of: self).selectedBackgroundColor
        }
    }

    private static let selectedBackgroundColor = UIColor.red

    override func configureInitially() {
        super.configureInitially()

        backgroundColor = .clear
        customView.label.highlightedTextColor = .white

        addSelectedBackgroundView()
    }

    private func addSelectedBackgroundView() {
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = type(of: self).selectedBackgroundColor
        self.selectedBackgroundView = selectedBackgroundView
    }
}

extension JapaneseNumberCell: ModelConfigurable {}
