//
//  User.swift
//  G&G
//
//  Created by Kylie Liang on 6/17/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let email: String
    var answered: Bool = false
    //let profileImageUrl: String
}
