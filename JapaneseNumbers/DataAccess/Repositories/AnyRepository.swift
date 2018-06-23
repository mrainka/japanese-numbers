//
//  AnyRepository.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

struct AnyRepository<ItemType> {

    private let _query: (Specification, @escaping (RepositoryQueryResult<ItemType>) -> Void) -> Void

    init<RepositoryType: Repository>(_ repository: RepositoryType) where RepositoryType.ItemType == ItemType {
        _query = repository.query
    }
}

extension AnyRepository: Repository {

    func query(_ specification: Specification, completion: @escaping (RepositoryQueryResult<ItemType>) -> Void) {
        _query(specification, completion)
    }
}
