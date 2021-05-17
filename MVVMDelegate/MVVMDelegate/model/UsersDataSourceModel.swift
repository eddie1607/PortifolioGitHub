//
//  UsersDataSourceModel.swift
//  MVVMDelegate
//
//  Created by Edmilson vieira da silva on 13/02/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import Foundation
struct User: Codable {
    let id: Int
    let name: String?
    let email: String?
}

protocol UsersDataSourceType {
    func fetchUsers(completion: @escaping (_ result: Result<[User]>) -> Void)
}

class UsersDataSource: UsersDataSourceType {

    func fetchUsers(completion: @escaping (_ result: Result<[User]>) -> Void) {
        NetworkClient.get(url: URL(string: "https://jsonplaceholder.typicode.com/users")!) { result in
            completion(result as Result<[User]>)
        }
    }

}
