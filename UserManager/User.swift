//
//  User.swift
//  UserManager
//
//  Created by Merianni Nunez Tejeda on 12/9/24.
//

// User.swift

import Foundation

struct User {
    var userInfo: UserInfo
    var userAccount: UserAccount
    var id: UUID
}

struct UserInfo {
    var firstName: String
    var lastName: String
    var age: Int
}

struct UserAccount {
    var email: String
    var password: String
}


