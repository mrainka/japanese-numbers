//
//  IndividualJapaneseNumberView.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 24/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

final class IndividualJapaneseNumberView: CustomView {

    private(set) var model: IndividualJapaneseNumberViewModel?

    private(set) weak var activityIndicatorView: UIActivityIndicatorView!
    private(set) weak var image: UIImageView!
    private(set) weak var label: UILabel!

    override func configureInitially() {
        super.configureInitially()
        backgroundColor = .veryLightGray
    }

    override func addSubviews() {
        image = addImage()
        label = addLabel()
        activityIndicatorView = addActivityIndicatorView()
    }

    // MARK: - Making Constraints

    override func makeConstraints() {
        makeConstraintsForActivityIndicatorView()
        makeConstraintsForImage(with: [.centerX, .centerY])
        makeConstraintsForLabel()
    }

    private func makeConstraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            .init(
                item: label,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: label.superview,
                attribute: .centerX,
                multiplier: 1,
                constant: 0),
            .init(
                item: label,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: label.superview,
                attribute: .centerY,
                multiplier: 0.5,
                constant: 0)
        ])
    }

    // MARK: - Preparing for Interface Builder

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        prepareImageForInterfaceBuilder(withSize: 100)
        label.text = "Ichi"
    }
}

extension IndividualJapaneseNumberView: ActivityIndicableView {}

extension IndividualJapaneseNumberView: JapaneseNumberView {}

extension IndividualJapaneseNumberView: ModelConfigurable {

    func configure(with model: IndividualJapaneseNumberViewModel) {
        model.onDataFetched = { [unowned self] in
            self.stopIndicatingActivity()

            self.image.configure(with: model.imageURL)
            self.label.text = model.label
        }

        self.model = model
    }
}
