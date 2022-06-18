//
//  UserService.swift
//  G&G
//
//  Created by Kylie Liang on 6/17/22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void)
    {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
                //("DEBUG: Username: \(user.username)")
                //print("DEBUG: Email: \(user.email)")
            }
    }
}
