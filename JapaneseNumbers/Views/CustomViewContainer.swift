//
//  CustomViewContainer.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

protocol CustomViewContainer {

    associatedtype CustomViewType: UIView

    var customView: CustomViewType! { get }
}
