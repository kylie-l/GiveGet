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
        VStack (alignment: .leading, spacing: 12){
            ZStack(alignment: .leading){
                Color(.systemBlue)
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily Journals")
                        .font(.system(size: 35, weight: .semibold, design: .default))
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
            }
            .frame(height: 90)
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.prompts) { prompt in
                        Spacer()
                        JournalViewRow(prompt: prompt)
                        Spacer()
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
