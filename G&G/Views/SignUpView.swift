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
    @State var selection: Int? = nil
   //@Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("Background Cream")
                    .ignoresSafeArea()
                
                VStack {
                    
                    
                    NavigationLink(destination: ProfileSelectorView(),
                                   isActive: $viewModel.didAuthenticateUser){
                        
                    }
                       // .navigationBarBackButtonHidden(true)
                    
                    
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
                        
                        //NavigationLink (destination: ProfileSelectorView(), tag: 1, selection: $selection)
                        //{
                            Button {
                                let _ = print(viewModel.currentUser?.answered ?? "no")
                                //viewModel.currentUser?.answered = false
                                viewModel.register(username:username,
                                                   password: password, confirm: confirm, withEmail: email)
                               self.selection = 1
                            } label: {
                                Text("CONFIRM")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 340, height: 50)
                                    .background(Color("Bold Green"))
                                    .clipShape(Capsule())
                            }
                            .shadow(color: .gray, radius: 1, x:0, y:4)
                        //}
                        
                        Spacer()
                    }
                    .padding(32)
                    .padding(.bottom, 50)
                    
                }
            
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
