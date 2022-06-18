//
//  SignUpView.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirm = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack{
            Color("Background Cream")
                .ignoresSafeArea()
            
            VStack {
                AuthHeadingV(title: "SIGN UP")
                    .padding(.bottom, 10)
                    .padding(.top, 20)
                    .foregroundColor(Color("Text Dark Color"))
                
                //info
                VStack{
                    CustomInputField(imageName: "person", placeholderText: "Enter Username", text: $username)
                        .padding(.bottom, 20)
                    CustomInputField(imageName: "envelope", placeholderText: "Enter Email", text: $email)
                        .padding(.bottom, 20)
                    CustomInputField(imageName: "lock", placeholderText: "Enter Password",isSecureField: true, text: $password)
                        .padding(.bottom, 20)
                    CustomInputField(imageName: "lock", placeholderText: "Confirm Password", isSecureField: true, text: $confirm)
                        .padding(.bottom, 40)
                    
                    Button {
                        viewModel.register(username:username,
                                           password: password, confirm: confirm, withEmail: email)
                    } label: {
                        Text("CONFIRM")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 340, height: 50)
                            .background(Color("Bold Green"))
                            .clipShape(Capsule())
                    }
                    .shadow(color: .gray, radius: 1, x:0, y:4)
                    
                    Spacer()
                }
                .padding(32)
                .padding(.bottom, 50)
                
            }
        
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
