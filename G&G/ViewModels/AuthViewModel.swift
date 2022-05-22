//
//  AuthViewModel.swift
//  G&G
//
//  Created by Kylie Liang on 5/22/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        //print("DEBUG: user session is \(self.userSession)")
    }
        
    func login(username: String, password: String) {
        print("DEBUG: Login w/ username \(username)")
    }
    
    func register(username: String, password: String, confirm: String, email: String) {
        Auth.auth().createUser(withEmail: username, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to register with error")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
}
