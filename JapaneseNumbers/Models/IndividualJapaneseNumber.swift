//
//  IndividualJapaneseNumber.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import Foundation

struct IndividualJapaneseNumber {

    private enum CodingKeys: String, CodingKey {

        case imageURL = "image"
        case text
    }

    let imageURL: URL?
    let text: String
}

extension IndividualJapaneseNumber: Decodable {

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        imageURL = try? values.decode(URL.self, forKey: .imageURL)
        text = try values.decode(String.self, forKey: .text)
    }
}

extension IndividualJapaneseNumber: JapaneseNumber {}
