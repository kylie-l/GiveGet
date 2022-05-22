//
//  AnswerPromptView.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import SwiftUI

struct AnswerPromptView: View {
    var body: some View {
        VStack{
            //Top Menu Bar
            ZStack{
                Color("Accent Green")
                    .ignoresSafeArea()
                
                //TEXT
                VStack{
                    Text("DAILY JOURNAL")
                        .padding()
                        
                        
                    
                    Text("What are you grateful for today?")
                    
                }
                .foregroundColor(.white)
                
            }
            .frame(height: 150)
            
            
            //Main
            ZStack{
                Color("Background Cream")
                    .ignoresSafeArea()
                
                
                VStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 327, height: 294)
                        .foregroundColor(Color("Accent Cream"))
                        
                        
                    
                    
                }
                
                
                
            }
            
            
            
            
            
            
        }
    }
}

struct AnswerPromptView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerPromptView()
    }
}
