//
//  CustomTableViewCell.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

class CustomTableViewCell<CustomViewType: UIView>: UITableViewCell {

    private(set) weak var customView: CustomViewType!

    class var inset: UIEdgeInsets { return .zero }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureInitially()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureInitially() {
        addCustomView()
        makeConstraintsForCustomView()
    }

    private func addCustomView() {
        let customView = CustomViewType(frame: .zero)
        contentView.addSubview(customView)
        self.customView = customView
    }

    private func makeConstraintsForCustomView() {
        customView.translatesAutoresizingMaskIntoConstraints = false

        let inset = type(of: self).inset

        let attributes = [(NSLayoutAttribute, CGFloat)]([
            (.bottom, -inset.bottom),
            (.left, inset.left),
            (.right, -inset.right),
            (.top, inset.bottom)
        ])

        NSLayoutConstraint.activate(attributes.map {
            .init(
                item: customView,
                attribute: $0,
                relatedBy: .equal,
                toItem: customView.superview,
                attribute: $0,
                multiplier: 1,
                constant: $1)
        })
    }
}

extension CustomTableViewCell: CustomViewContainer {}

extension CustomTableViewCell: InitiallyConfigurable {}
