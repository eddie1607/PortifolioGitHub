//
//  UserItemModel.swift
//  MVVMDelegate
//
//  Created by Edmilson vieira da silva on 13/02/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import Foundation

struct UserItemModel {

    var name: String
    var email: String

    init(user: User) {
        name = user.name ?? ""
        email = user.email ?? ""
    }
    
}
