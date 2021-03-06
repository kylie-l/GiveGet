//
//  UploadService.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import Firebase

struct UploadService{
    func uploadPrompt(caption: String, completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid,
                    "caption": caption,
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

    func fetchPrompts(completion: @escaping([Prompt]) -> Void){
        Firestore.firestore().collection("prompts")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
            
            let prompts = documents.compactMap({ try? $0.data(as: Prompt.self) })
            
            completion(prompts)
        }
    }
}

