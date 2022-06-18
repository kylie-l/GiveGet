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
            ZStack(alignment: .leading){
                Color("Accent Green")
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("DAILY JOURNAL")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.top, 20)
                        
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
                }
                .padding(.horizontal)
                .foregroundColor(.white)
            }
            .frame(height: 80)
            
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
            
        }
        
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
