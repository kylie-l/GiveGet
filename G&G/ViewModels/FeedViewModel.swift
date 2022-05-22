//
//  FeedViewModel.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import Foundation

class FeedViewModel: ObservableObject{
    @Published var prompts = [Prompt]()
    let service = UploadService()
    
    init() {
        fetchPrompts()
    }
    
    func fetchPrompts(){
        service.fetchPrompts{prompts in
            self.prompts = prompts
            print("testasdfasdf")
            print(prompts.count)
        }
        
        
        
        
        
    }
}
