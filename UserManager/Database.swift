//
//  Database.swift
//  UserManager
//
//  Created by Merianni Nunez Tejeda on 12/9/24.
//

// Database.swift

import Foundation

class Database {
    private static var users: [User] = []
    private static var user: User?
    private static var emails: [String] = []
    private static var message: [String] = []
    
    // make a dictionary of emails and messages
    private static var emailMessages: [String: String] = [:]

    static func addUser(user: User) {
        users.append(user)
    }

    static func deleteUser(user: User) {
        Database.users.removeAll(where: { $0.id == user.id })
    }
    
    static func getUser(id: UUID) -> User? {
        Database.users.first(where: { $0.id == id })
    }
    
    func sendEmail(email: String, message: String) {
        let emailMessage: String = "\(email): \(message)"
        Database.emailMessages[email] = emailMessage
    }
}
