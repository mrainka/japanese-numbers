//
//  Repository.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

protocol Repository {

    associatedtype ItemType

    func query(_ specification: Specification, completion: @escaping (RepositoryQueryResult<ItemType>) -> Void)
}
