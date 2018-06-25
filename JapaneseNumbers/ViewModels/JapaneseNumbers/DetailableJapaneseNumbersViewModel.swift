//
//  DetailableJapaneseNumbersViewModel.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 24/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

final class DetailableJapaneseNumbersViewModel {

    let list: JapaneseNumbersViewModel

    var isCollapsed: (() -> Bool)?

    var onOpenDetailRequested: ((IndividualJapaneseNumberViewModel) -> Void)?

    private let detailRepository: AnyRepository<IndividualJapaneseNumber>

    init(
        detailRepository: AnyRepository<IndividualJapaneseNumber> = .init(NetworkRepository()),
        listRepository: AnyRepository<[ListedJapaneseNumber]> = .init(NetworkRepository()))
    {
        self.detailRepository = detailRepository

        list = .init(repository: listRepository)

        list.onItemSelected.append { [unowned self] in
            let detail = IndividualJapaneseNumberViewModel(name: $0.name, repository: self.detailRepository)
            self.onOpenDetailRequested?(detail)
        }

        list.onItemsShowed = { [unowned self] in self.selectFirstItemIfNotCollapsedAndNothingIsSelected() }
    }

    func selectFirstItemIfNotCollapsedAndNothingIsSelected() {
        guard !(isCollapsed?() ?? true), !list.isItemSelected else { return }
        list.selectFirstItem()
    }
}
