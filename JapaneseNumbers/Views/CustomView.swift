//
//  CustomView.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureInitially()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureInitially() {
        addSubviews()
        makeConstraints()
    }

    /// If you subclass CustomView directly, your implementation of this method does not need to call `super`.
    func addSubviews() {}

    /// If you subclass CustomView directly, your implementation of this method does not need to call `super`.
    func makeConstraints() {}
}

extension CustomView: InitiallyConfigurable {}
