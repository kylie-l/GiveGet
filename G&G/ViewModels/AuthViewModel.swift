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
    @Published var answeredPrompt: Bool
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.answeredPrompt = false;
        //print("DEBUG: user session is \(self.userSession?.uid)")
    }
    
    func on (){
        self.answeredPrompt = true
    }
    
    func off (){
        self.answeredPrompt = false
    }
        
    func login(withEmail email: String, password: String) {
           Auth.auth().signIn(withEmail: email, password: password) { result, error in
               if let error = error {
                   print("DEBUG: failed to sign in with error \(error.localizedDescription)")
                   return
               }

               guard let user = result?.user else { return }
               self.userSession = user
               print("DEBUG: Did log user in..")
           }
    }
    
    
    func register(username: String, password: String, confirm: String, withEmail email: String) {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to register with error \(error.localizedDescription)")
                                return
                            }

                            if(!(password==confirm)) {
                                print("DEBUG: passwords don't match")
                return
            }
            
            if(!(password==confirm)) {
                print("DEBUG: passwords don't match")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "password": password,
                        "uid": user.uid]
                
                Firestore.firestore().collection("users")
                    .document(user.uid)
                    .setData(data) { _ in
                        print("DEBUG: did upload user data")
                    }
        }
    }
    
    func signOut() {
        userSession = nil
        
        //signs out on backend
        try? Auth.auth().signOut()
    }
}
