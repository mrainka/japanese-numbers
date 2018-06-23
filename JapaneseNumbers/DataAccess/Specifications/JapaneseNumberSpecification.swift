//
//  JapaneseNumberSpecification.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

struct JapaneseNumberSpecification {

    let networkRoute: NetworkRoute

    init(name: String) {
        networkRoute = .japaneseNumber(name: name)
    }
}

extension JapaneseNumberSpecification: NetworkSpecification {}
