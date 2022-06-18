//
//  HomeView.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var viewModelAuth: AuthViewModel

    @ObservedObject var viewModel = FeedViewModel()

    
    var body: some View {
        VStack (alignment: .leading){
            
            Spacer()
                .frame(height:30)
            //title
            VStack(alignment: .leading) {
                
                Text("DAILY JOURNAL")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    //.padding(.top, 20)
                    
                HStack {
                    Text("What are you grateful for today?")
                    
                    Spacer()
                    Button {
                        viewModelAuth.signOut()
                    } label: {
                        Text("Log Out")
                            .foregroundColor(Color.black)
                    }
                }
                .padding(.bottom, 5)
            }
            .padding(.horizontal)
            //.padding(.top, 25)
            .foregroundColor(.white)
            
            
            //feed
            ZStack{
                Color("Background Cream")
                    .ignoresSafeArea()
                ScrollView{
                    
                    /*
                     LazyVStack {
                         ForEach(0 ... 10, id: \.self) { _ in
                             JournalViewRow()
                             Spacer()
                         }
                     }
                    }*/
                    LazyVStack {
                        ForEach(viewModel.prompts) { prompt in
                            JournalViewRow(prompt: prompt)
                                .padding()
                        }
                    }
                    
                }
            }
            .cornerRadius(10)
            
        }
        
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
