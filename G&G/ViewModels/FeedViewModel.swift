//
//  FeedViewModel.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import Foundation

class FeedViewModel: ObservableObject{
    let service = UploadService()
    
    init() {
        fetchPrompts()
    }
    
    func fetchPrompts(){
        service.fetchPrompts() 
    }
}
