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

    // MARK: - Adding Subviews

    override func addSubviews() {
        addImage()
        addLabel()
    }

    private func addImage() {
        let image = UIImageView(frame: .zero)
        addSubview(image)
        self.image = image
    }

    private func addLabel() {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 28)
        addSubview(label)
        self.label = label
    }

    // MARK: - Making Constraints

    override func makeConstraints() {
        makeConstraintsForImage()
        makeConstraintsForLabel()
    }

    private func makeConstraintsForImage() {
        image.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([.centerY, .right].map {
            .init(
                item: image,
                attribute: $0,
                relatedBy: .equal,
                toItem: image.superview,
                attribute: $0,
                multiplier: 1,
                constant: 0)
        })
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

        prepareImageForInterfaceBuilder()
        label.text = "100"
    }

    private func prepareImageForInterfaceBuilder() {
        image.backgroundColor = .lightGray

        NSLayoutConstraint.activate([.height, .width].map {
            .init(
                item: image,
                attribute: $0,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 50)
        })
    }
}

extension ListedJapaneseNumberView: ModelConfigurable {

    func configure(with model: ListedJapaneseNumberViewModel) {
        self.model = model

        image.configure(with: model.imageURL)
        label.text = model.label
    }
}
