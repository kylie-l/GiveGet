//
//  UploadService.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import Firebase

struct uploadPrompt(caption: String){
    
    guard let uid = Auth.auth().currentUser?.uid else {return}
    
    let data = ["uid": uid, "caption": caption,
                "timestamp": Timestamp(date: Date())] as [String : Any]
    Firestore.firestore().collection("prompts").document().setData(data) { _ in
        print("Uploaded Prompt")
    }
    
}
