//
//  NetworkRoute.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import Foundation

enum NetworkRoute {

    case japaneseNumber(name: String)
    case japaneseNumbers

    private var queryItems: [URLQueryItem]? {
        switch self {
        case .japaneseNumber(let name):
            return [.init(name: "name", value: name)]
        case .japaneseNumbers:
            return nil
        }
    }

    var url: URL? {
        guard var components = URLComponents(string: "http://dev.tapptic.com/test/json.php") else { return nil }
        components.queryItems = queryItems
        return components.url
    }
}
