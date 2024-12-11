//
//  UserManagerTests.swift
//  UserManagerTests
//
//  Created by Merianni Nunez Tejeda on 12/9/24.
//

import XCTest
@testable import UserManager

final class UserManagerTests: XCTestCase {

    func whenIsFieldsValid_givenAllFields_thenReturnTrue() {
        let userInfo = UserInfo(firstName: "Merianni", lastName: "Nunez", age: 90)
        let userAccount = UserAccount(email: "merianni@gmail.com", password: "12345678")
        let user = User(userInfo: userInfo, userAccount: userAccount, id: UUID())
        let userManager = UserManager(user: user, userAccount: userAccount, userInfo: userInfo)
        
        XCTAssertTrue(userManager.isFieldsValid())
    }
    
    func whenIsFieldsValid_givenMissingFields_thenReturnFalse() {
        let userInfo = UserInfo(firstName: "", lastName: "Nunez", age: 90)
        let userAccount = UserAccount(email: "merianni@gmail.com", password: "12345678")
        let user = User(userInfo: userInfo, userAccount: userAccount, id: UUID())
        let userManager = UserManager(user: user, userAccount: userAccount, userInfo: userInfo)
        
        XCTAssertTrue(userManager.isFieldsValid())
    }

    func whenIsAgeValid_givenValidAge_thenReturnTrue() {
        let userInfo = UserInfo(firstName: "Merianni", lastName: "Nunez", age: 90)
        let userAccount = UserAccount(email: "merianni@gmail.com", password: "12345678")
        let user = User(userInfo: userInfo, userAccount: userAccount, id: UUID())
        let userManager = UserManager(user: user, userAccount: userAccount, userInfo: userInfo)
        
        XCTAssertTrue(userManager.isAgeValid(age: 90))
    }
    
    func whenIsAgeValid_givenUnderage_thenReturnFalse() {
        let userInfo = UserInfo(firstName: "Merianni", lastName: "Nunez", age: 9)
        let userAccount = UserAccount(email: "merianni@gmail.com", password: "12345678")
        let user = User(userInfo: userInfo, userAccount: userAccount, id: UUID())
        let userManager = UserManager(user: user, userAccount: userAccount, userInfo: userInfo)
        
        XCTAssertFalse(userManager.isAgeValid(age: 9))
    }
    
    func whenRegisterUser_givenValidUserInfo_thenReturnTrue() {
        let userInfo = UserInfo(firstName: "Merianni", lastName: "Nunez", age: 90)
        let userAccount = UserAccount(email: "merianni@gmail.com", password: "12345678")
        let user = User(userInfo: userInfo, userAccount: userAccount, id: UUID())
        let userManager = UserManager(user: user, userAccount: userAccount, userInfo: userInfo)
        
        userManager.register(user: user)
        XCTAssertTrue(Database.getUser(id: user.id) != nil)
    }
    
    func whenRegisterUse_giveInvalidInfo_thenReturnFalse() {
        let userInfo = UserInfo(firstName: "", lastName: "", age: 90)
        let userAccount = UserAccount(email: "merianni@gmail.com", password: "12345678")
        let user = User(userInfo: userInfo, userAccount: userAccount, id: UUID())
        let userManager = UserManager(user: user, userAccount: userAccount, userInfo: userInfo)
        
        userManager.register(user: user)
        XCTAssertFalse(Database.getUser(id: user.id) != nil)
    }
    
    func whenAuthenticatingUser_giveValidInfo_thenReturnTrue() {
        let userInfo = UserInfo(firstName: "Merianni", lastName: "Nunez", age: 90)
        let userAccount = UserAccount(email: "merianni@gmail.com", password: "12345678")
        let user = User(userInfo: userInfo, userAccount: userAccount, id: UUID())
        Database.addUser(user: user)
        
        let userManager = UserManager(user: user, userAccount: userAccount, userInfo: userInfo)
        XCTAssertTrue(userManager.authenticateUser(id: user.id, email: "merianni@gmail.com", password: "12345678"))
    }
    
    func whenAuthenticatingUser_givenInvalidInfo_thenReturnFalse() {
        let userInfo = UserInfo(firstName: "Merianni", lastName: "Nunez", age: 90)
        let userAccount = UserAccount(email: "merianni@gmail.com", password: "securePassword")
        let user = User(userInfo: userInfo, userAccount: userAccount, id: UUID())
        Database.addUser(user: user)
        
        let userManager = UserManager(user: user, userAccount: userAccount, userInfo: userInfo)
        XCTAssertFalse(userManager.authenticateUser(id: user.id, email: "merianni@gmail.com", password: "wrongPassword"))
    }
    
    func whenAuthenticatingNonExistingUser_givenValidInfo_thenReturnFalse() {
        let userManager = UserManager(user: User(userInfo: UserInfo(firstName: "", lastName: "", age: 0), userAccount: UserAccount(email: "", password: ""), id: UUID()), userAccount: UserAccount(email: "", password: ""), userInfo: UserInfo(firstName: "", lastName: "", age: 0))
        XCTAssertFalse(userManager.authenticateUser(id: UUID(), email: "merianni@gmail.com", password: "12345678"))
    }
}
