//
//  ModelConfiguration.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

protocol ModelConfigurable {

    associatedtype ModelType

    var model: ModelType? { get }

    func configure(with model: ModelType)
}
