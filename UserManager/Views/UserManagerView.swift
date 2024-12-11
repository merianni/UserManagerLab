//
//  UserManagerView.swift
//  UserManager
//
//  Created by Merianni Nunez Tejeda on 12/9/24.
//

import SwiftUI
import Foundation


struct UserManagerView: View {
    
    var isPresented: Bool = false
    var userInfo: UserInfo
    var userAccount: UserAccount

    init(userInfo: UserInfo, userAccount: UserAccount) {
        self.userInfo = userInfo
        self.userAccount = userAccount
    }
    
    var body: some View {
        
        Text("User Info")
            .font(.title)
            .padding()
        // add two textfields for user to add first name, las name, and age
        TextField("First Name", text: $userInfo.firstName)
        TextField("Last Name", text: $userInfo.lastName)
        TextField("Age", text: $userInfo.age)
        
        
        
    }
}

#Preview {
    UserManagerView()
}
