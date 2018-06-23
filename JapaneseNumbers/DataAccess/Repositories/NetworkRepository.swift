//
//  NetworkRepository.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 23/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import Dispatch
import Foundation

struct NetworkRepository<ItemType> where ItemType: Decodable {}

extension NetworkRepository: Repository {

    func query(_ specification: Specification, completion: @escaping (RepositoryQueryResult<ItemType>) -> Void) {
        guard let url = (specification as? NetworkSpecification)?.networkRoute.url else {
            completion(.failure)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                DispatchQueue.main.async { completion(.failure) }
                return
            }

            DispatchQueue.global(qos: .userInteractive).async {
                let item = try? JSONDecoder().decode(ItemType.self, from: data)

                DispatchQueue.main.async {
                    if let item = item {
                        completion(.success(item))
                    } else {
                        completion(.failure)
                    }
                }
            }
        }

        task.resume()
    }
}
