//
//  AnswerPromptView.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import SwiftUI

struct AnswerPromptView: View {
    
    
    @State private var promptAnswer = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadPrompt()
    
    
    
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
                        .font(.system(size: 22, weight: .bold))
                        
                        
                        
                    
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
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 327, height: 294)
                            .foregroundColor(Color("Accent Cream"))
                        
                        AnswerPromptInputField("Write your message", text: $promptAnswer)
                        
                        
                    }
                    
                    
                    
                    Button {
                        viewModel.uploadPrompt(withCaption: promptAnswer)
                        
                    } label: {
                        
                        Text("SUBMIT")
                            .padding()
                            .frame(width: 202, height: 92)
                                .background(Color("Greyish Green"))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .font(.system(size: 22, weight: .bold))
                            .padding(.top, 70)
                            
                        
                            
                            
                    }
                    
                }
                
               
                
                
                
            }
            
            
            
            
            
            
        }
    }
}

struct AnswerPromptView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerPromptView()
            .previewDevice("iPhone 11 Pro")
            .previewInterfaceOrientation(.portrait)
    }
}
