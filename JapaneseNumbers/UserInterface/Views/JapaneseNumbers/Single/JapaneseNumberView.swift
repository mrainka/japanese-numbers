//
//  JapaneseNumberView.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 24/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

protocol JapaneseNumberView: ModelConfigurable where Self: CustomView, ModelType: JapaneseNumberViewModel {

    var image: UIImageView! { get }
    var label: UILabel! { get }
}

extension JapaneseNumberView {

    // MARK: - Adding Subviews

    func addImage() -> UIImageView {
        let image = UIImageView(frame: .zero)
        addSubview(image)
        return image
    }

    func addLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 28)
        addSubview(label)
        return label
    }

    // MARK: - Making Constraints

    func makeConstraintsForImage(with attributes: [NSLayoutAttribute]) {
        image.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(attributes.map {
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

    // MARK: - Preparing for Interface Builder

    func prepareImageForInterfaceBuilder(withSize size: CGFloat) {
        image.backgroundColor = .lightGray

        NSLayoutConstraint.activate([.height, .width].map {
            .init(
                item: image,
                attribute: $0,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: size)
        })
    }
}
