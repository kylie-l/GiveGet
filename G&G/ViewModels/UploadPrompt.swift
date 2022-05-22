//
//  UploadPrompt.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import Foundation

class UploadPrompt: ObservableObject{
    
    let service = UploadService()
    
    func uploadPrompt(withCaption caption: String){
        service.uploadPrompt(caption: caption) { success in
            if success {
                return
            } else{
                return
            }
        }
    }
}
