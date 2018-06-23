//
//  JapaneseNumber.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import Foundation

protocol JapaneseNumber: Decodable {

    var imageURL: URL? { get }
}
