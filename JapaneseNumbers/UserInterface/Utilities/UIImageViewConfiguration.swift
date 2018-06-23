//
//  UIImageViewConfiguration.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import Foundation
import SDWebImage
import UIKit

extension UIImageView: ModelConfigurable {

    var model: URL?? { return sd_imageURL() }

    func configure(with model: URL?) {
        sd_setImage(with: model)
    }
}
