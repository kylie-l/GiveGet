//
//  Prompt.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import FirebaseFirestoreSwift
import Firebase


struct Prompt: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    
    
    
    
    
}
