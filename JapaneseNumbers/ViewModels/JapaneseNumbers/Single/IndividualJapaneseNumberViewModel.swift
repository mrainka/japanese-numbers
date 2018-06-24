//
//  IndividualJapaneseNumberViewModel.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 24/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import Foundation

final class IndividualJapaneseNumberViewModel {

    private(set) var imageURL: URL?
    private(set) var label: String?

    private let name: String

    var onDataFetched: (() -> Void)?

    private let repository: AnyRepository<IndividualJapaneseNumber>

    init(name: String, repository: AnyRepository<IndividualJapaneseNumber> = .init(NetworkRepository())) {
        self.name = name
        self.repository = repository
    }

    func fetchData() {
        repository.query(JapaneseNumberSpecification(name: name)) { [weak self] in
            switch $0 {
            case .failure:
                break  // TODO: Error handling.
            case .success(let item):
                guard let `self` = self else { return }

                self.imageURL = item.imageURL
                self.label = item.text

                self.onDataFetched?()
            }
        }
    }
}

extension IndividualJapaneseNumberViewModel: JapaneseNumberViewModel {}
