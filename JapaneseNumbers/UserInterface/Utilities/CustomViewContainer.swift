//
//  CustomViewContainer.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

protocol CustomViewContainer: class {

    associatedtype CustomViewType: UIView

    var customView: CustomViewType! { get }

    var isCustomViewLoaded: Bool { get }

    var onCustomViewLoaded: (() -> Void)? { get set }
}

extension CustomViewContainer {

    var isCustomViewLoaded: Bool { return true }

    var onCustomViewLoaded: (() -> Void)? { get { return nil } set {} }
}

extension ModelConfigurable where Self: CustomViewContainer, Self.CustomViewType: ModelConfigurable {

    var model: CustomViewType.ModelType? { return customView.model }

    func configure(with model: CustomViewType.ModelType) {
        guard isCustomViewLoaded else {
            onCustomViewLoaded = { [unowned self] in self.customView.configure(with: model) }
            return
        }

        customView.configure(with: model)
    }
}
