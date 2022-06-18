//
//  CustomInputField.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                
                VStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25,height: 25)
                        .foregroundColor(Color("Text Color"))
                }
                .frame(width: 50,height: 50)
                .background(Color("Bold Green"))
                .cornerRadius(30)
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                }
                else {
                    TextField(placeholderText, text: $text)
                        .foregroundColor(Color(.white))
                        //.disableAutocorrection(true)
                }
                
            }
            .background(Color("Light Green"))
            .cornerRadius(30)
        }
        .shadow(color: .gray, radius: 1, x:0, y:4)
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope",
                         placeholderText: "Email",
                         isSecureField: false,
                         text: .constant(""))
    }
}
