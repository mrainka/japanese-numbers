//
//  JapaneseNumbersViewModel.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import Dispatch

final class JapaneseNumbersViewModel {

    private(set) var items = [ListedJapaneseNumberViewModel]()

    private(set) var isItemSelected = false
    var onItemSelected = [((ListedJapaneseNumberViewModel) -> Void)]()

    var onItemsFetched: (() -> Void)?
    var onItemsShowed: (() -> Void)?

    private let repository: AnyRepository<[ListedJapaneseNumber]>

    init(repository: AnyRepository<[ListedJapaneseNumber]> = .init(NetworkRepository())) {
        self.repository = repository
    }

    func fetchItems() {
        repository.query(JapaneseNumbersSpecification()) { [weak self] in
            switch $0 {
            case .failure:
                break  // TODO: Error handling.
            case .success(let items):
                DispatchQueue.global(qos: .userInteractive).async {
                    let items = items.map(ListedJapaneseNumberViewModel.init)

                    DispatchQueue.main.async {
                        guard let `self` = self else { return }
                        self.items = items
                        self.onItemsFetched?()
                    }
                }
            }
        }
    }
}

extension JapaneseNumbersViewModel: Itemized {

    func select(_ item: ListedJapaneseNumberViewModel) {
        isItemSelected = true
        onItemSelected.forEach { $0(item) }
    }
}
