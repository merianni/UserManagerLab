//
//  UserManager.swift
//  UserManager
//
//  Created by Merianni Nunez Tejeda on 12/9/24.
//

// UserManager.swift

import Foundation

class UserManager {
    var user: User
    var userAccount: UserAccount
    var userInfo: UserInfo
    var id = UUID()
    
    init(user: User, userAccount: UserAccount, userInfo: UserInfo, id: UUID = UUID()) {
        self.user = user
        self.userAccount = userAccount
        self.userInfo = userInfo
        self.id = id
    }
    
    func register(user: User) {
        let user = User(userInfo: userInfo, userAccount: userAccount, id: id)
        Database.addUser(user: user)
    }

    func registerUserAccount(email: String, password: String) {
        if isPasswordValid() == true {
            let email = userAccount.email
            let password = userAccount.password
            _ = UserAccount(email: email, password: password)
        }
    }
    
    func registerUserInfo(firstName: String, lastName: String, age: Int) {
        if isFieldsValid() == true {
            let firstName = userInfo.firstName
            let lastName = userInfo.lastName
            let age = userInfo.age
            if isAgeValid(age: age) == true {
               _ = UserInfo(firstName: firstName, lastName: lastName, age: age)
            }
        }
    }

    // check that all fields are filled
    func isFieldsValid() -> Bool {
        if userInfo.firstName.isEmpty || userInfo.lastName.isEmpty || userInfo.age.isMultiple(of: 1) {
            return false
        }
        return true
    }
    
    // create a boolean to check if age is valid
    func isAgeValid(age: Int) -> Bool {
        let age = userInfo.age
        if age < 18 {
            return false
        }
        return true
    }
    
    // check Password is longer than 6 characters
    func isPasswordValid() -> Bool {
        if userAccount.password.count < 6 {
            return false
        }
        return true
    }
    
    // check if email is valid
    func isEmailValid() -> Bool {
        if !userAccount.email.isEmpty {
            if !userAccount.email.contains("@") {
                return false
            }
        }
        return true
    }
    
    func authenticate(email: String, password: String) -> Bool {
        return userAccount.email == email && userAccount.password == password
    }
    
    func authenticateUser(id: UUID, email: String, password: String) -> Bool {
        guard let user = Database.getUser(id: id) else { return false }
        return user.userAccount.email == email && user.userAccount.password == password
    }
}


