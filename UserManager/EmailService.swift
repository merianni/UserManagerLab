//
//  EmailService.swift
//  UserManager
//
//  Created by Merianni Nunez Tejeda on 12/9/24.
//

// EmailService.swift

import Foundation

class EmailService {
    func sendWelcomeEmail(email: String) {
        let welcomeMessage = "Welcome to UserManager!"
        Database.init().sendEmail(email: email, message: welcomeMessage)
    }
}
