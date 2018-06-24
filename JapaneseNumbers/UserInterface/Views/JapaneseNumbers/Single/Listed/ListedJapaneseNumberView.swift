//
//  ListedJapaneseNumberView.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

final class ListedJapaneseNumberView: CustomView {

    private(set) var model: ListedJapaneseNumberViewModel?

    private(set) weak var image: UIImageView!
    private(set) weak var label: UILabel!

    override func addSubviews() {
        image = addImage()
        label = addLabel()
    }

    // MARK: - Making Constraints

    override func makeConstraints() {
        makeConstraintsForImage(with: [.centerY, .right])
        makeConstraintsForLabel()
    }

    private func makeConstraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([.centerY, .left].map {
            .init(
                item: label,
                attribute: $0,
                relatedBy: .equal,
                toItem: label.superview,
                attribute: $0,
                multiplier: 1,
                constant: 0)
        })
    }

    // MARK: - Preparing for Interface Builder

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        prepareImageForInterfaceBuilder(withSize: 50)
        label.text = "100"
    }
}

extension ListedJapaneseNumberView: JapaneseNumberView {}

extension ListedJapaneseNumberView: ModelConfigurable {

    func configure(with model: ListedJapaneseNumberViewModel) {
        self.model = model

        image.configure(with: model.imageURL)
        label.text = model.label
    }
}
