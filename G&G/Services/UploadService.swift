//
//  UploadService.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import Firebase

struct UploadService{
    /*
    func uploadPrompt(caption: String, completion: @escaping(Bool) -> Void){
        
            
        let data = ["caption": caption,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("prompts").document().setData(data) { error in
            if let error = error {
                print ("DEBUG: Failed to upload prompt: \(error.localizedDescription)")
                completion(false)
                return
            }
            completion(true)
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
    */
}

