//
//  AnswerPromptInputField.swift
//  G&G
//
//  Created by Michael Liu on 5/22/22.
//
 
import SwiftUI

struct AnswerPromptInputField: View {
    @Binding var text:String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>){
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    
    var body: some View {
        
        
        VStack{
            Spacer()
            
            ZStack(alignment: .topLeading){
                
                if text.isEmpty{
                    Text(placeholder)
                        .foregroundColor(Color(.placeholderText))
                        .padding()
                }
                TextEditor(text: $text)
                    .padding()
            
            }
            .padding(.horizontal, 35)
            .padding(.vertical, 40)
            .font(.body)
            
            Spacer()
        }
    }
}
