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
        VStack {
            AuthHeadingV(title: "SIGN UP")
                .padding(.bottom, 20)
                .padding(.top, 20)
            
            //info
            VStack{
                CustomInputField(imageName: "person", placeholderText: "Enter Username", text: $username)
                    .padding(.bottom, 20)
                CustomInputField(imageName: "envelope", placeholderText: "Enter Email", text: $email)
                    .padding(.bottom, 20)
                CustomInputField(imageName: "lock", placeholderText: "Enter Password", text: $password)
                    .padding(.bottom, 20)
                CustomInputField(imageName: "lock", placeholderText: "Confirm Password", text: $confirm)
                    .padding(.bottom, 40)
                
                Button {
                    viewModel.register(username:username,
                                       password: password, confirm: confirm, withEmail: email)
                } label: {
                    Text("CONFIRM")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(.green)
                        .clipShape(Capsule())
                }
                .shadow(color: .gray, radius: 1, x:0, y:4)
            }
            .padding(32)
            
            Spacer()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
