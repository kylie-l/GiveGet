//
//  UploadService.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import Firebase
struct UploadService{
    struct uploadPrompt(caption: String){
        
            
        let data = ["caption": caption,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        Firestore.firestore().collection("prompts").document().setData(data) { _ in
            print("Uploaded Prompt")
        }
        
    }
    
    func fetchPrompts(){
        Firestore.firestore().collection("prompts").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
        }
        documents.forEach { doc in
            print (doc.data())
        }
    }
    
}

