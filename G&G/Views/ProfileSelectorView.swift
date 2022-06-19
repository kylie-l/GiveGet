//
//  ProfileSelectorView.swift
//  G&G
//
//  Created by Kylie Liang on 6/18/22.
//

import SwiftUI

struct ProfileSelectorView: View {
    @State private var showImagePicker = false
    //ui image comes from uikit
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack{
            Color("Background Cream")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
    
                Image("gglogo")
                    .resizable()
                    .frame(width: 290, height: 215)
                    .scaledToFill()
                Text("Add a profile photo")
                    .font(.system(size: 40, weight: .regular, design: .default))
                    .foregroundColor(Color("Text Dark Color"))
                
                Button {
                    showImagePicker.toggle()
                } label: {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .modifier(ProfileImageModifier())
                    } else {
                        Image("plus_photo")
                            .renderingMode(.template)
                            .modifier(ProfileImageModifier())
                    }
                }
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage)
                }
                .padding(.vertical, 40)

                let _ = print("line 50")
                
                if let selectedImage = selectedImage {
                    let _ = print("line 53")
                    Button {
                        viewModel.uploadProfileImage(selectedImage)
                            
                    } label: {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(Color("Text Dark Color"))
                            .frame(width: 340, height: 50)
                            .background(Color("Accent Green"))
                            .clipShape(Capsule())
                            .padding()
                    }
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                }
                
                Spacer()
                //ProfileSelectorView()
            }
        }
        .ignoresSafeArea()
        
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        profileImage = Image(uiImage: selectedImage)

        print("load image")
        print(viewModel.userSession ?? "none")
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            //.resizable()
            .foregroundColor(Color("Accent Green"))
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfileSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectorView()
    }
}
