//
//  AnswerPromptView.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//

import SwiftUI

struct AnswerPromptView: View {
    
    @State var selection: Int? = nil
    @State private var promptAnswer = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    //@EnvironmentObject var answeredPrompt: Toggles
    @ObservedObject var viewModel = UploadPrompt()
    
    
    
    var body: some View {
        VStack{
            //Top Menu Bar
            ZStack{
                Color("Accent Green")
                    .ignoresSafeArea()
                    .shadow(color: .gray, radius: 1, x:0, y:2)
                
                //TEXT
                VStack{
                    Text("DAILY JOURNAL")
                        .padding(.top)
                        .padding(.horizontal)
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
                    
                    //text box
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 327, height: 380)
                            .foregroundColor(Color("Accent Cream"))
                            .shadow(color: .gray, radius: 1, x:0, y:2)
                        
                        AnswerPromptInputField("Write your message", text: $promptAnswer)
                            .padding()
                    
                        
                    }
                    
                    //NavigationLink (destination: HomeView(), tag: 1, selection: $selection) {
                        Button {
                            viewModel.uploadPrompt(withCaption: promptAnswer)
                            authViewModel.on()
                            self.selection = 1
                        } label: {
                            
                            Text("SUBMIT")
                                .padding()
                                .frame(width: 202, height: 92)
                                    .background(Color("Greyish Green"))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .font(.system(size: 22, weight: .bold))
                                .padding(.bottom, 70)
                                .shadow(color: .gray, radius: 1, x:0, y:2)
                                
                        }
                    
                    //}
                    
                }
                
            }
            
        }
        .background(Color("Background Cream"))
    }
}

struct AnswerPromptView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerPromptView()
            .previewDevice("iPhone 11 Pro")
            .previewInterfaceOrientation(.portrait)
    }
}
