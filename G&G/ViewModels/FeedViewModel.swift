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
    let userService = UserService()
    
    init() {
        fetchPrompts()
    }
    
    func fetchPrompts(){
        service.fetchPrompts{prompts in
            self.prompts = prompts
            
            for i in 0 ..< prompts.count {
                let uid = prompts[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.prompts[i].user = user
                }
            }
        }
    }
}
