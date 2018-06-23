//
//  ListedJapaneseNumber.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import Foundation

struct ListedJapaneseNumber {

    private enum CodingKeys: String, CodingKey {

        case imageURL = "image"
        case name
    }

    let imageURL: URL?
    let name: String
}

extension ListedJapaneseNumber: Decodable {

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        imageURL = try? values.decode(URL.self, forKey: .imageURL)
        name = try values.decode(String.self, forKey: .name)
    }
}

extension ListedJapaneseNumber: JapaneseNumber {}
