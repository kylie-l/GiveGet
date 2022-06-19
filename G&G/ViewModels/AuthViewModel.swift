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
    @Published var didAuthenticateUser = false
    @Published var answeredPrompt: Bool
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.answeredPrompt = false;
        self.fetchUser()
        //print("DEBUG: user session is \(self.userSession?.uid)")
    
    }
    
    func on (){
        self.currentUser?.answered = true
    }
    
    func off (){
        self.currentUser?.answered = false
    }
        
    func login(withEmail email: String, password: String) {
           Auth.auth().signIn(withEmail: email, password: password) { result, error in
               if let error = error {
                   print("DEBUG: failed to sign in with error \(error.localizedDescription)")
                   return
               }

               guard let user = result?.user else { return }
               self.userSession = user
               //self.fetchUser()
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
            self.tempUserSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "password": password,
                        "uid": user.uid,
                        "answered": false] as [String : Any]
                
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                    print("DEBUG: did upload user data")
                }
        }
    }
    
    func signOut() {
        userSession = nil
        
        //signs out on backend
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else {return}
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    if self.tempUserSession == nil {
                       print("nil")
                    }
                    else {
                        print("working")
                    }
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                    print(self.userSession == nil)
                }
        }
    }
}
