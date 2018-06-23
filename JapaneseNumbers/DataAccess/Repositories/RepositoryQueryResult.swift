//
//  RepositoryQueryResult.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

enum RepositoryQueryResult<ItemType> {

    case failure
    case success(ItemType)
}
