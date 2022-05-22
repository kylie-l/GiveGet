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
    
    
    
}

