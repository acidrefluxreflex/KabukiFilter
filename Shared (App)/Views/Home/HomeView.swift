//
//  HomeView.swift
//  PureFilter
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import SwiftUI

struct HomeView: View {
    
    private let lc = LocalizeCodes()
    
    var body: some View {
        
        VStack {
            TimerView()
                .frame(height: 200)
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        CircleButtonStyle(text: "Contact", systemName: "envelope")
                        CircleButtonStyle(text: "Hint", systemName: "questionmark")
                        CircleButtonStyle(text: "Web", systemName: "globe")
                        CircleButtonStyle(text: "Web", systemName: "globe")
                        CircleButtonStyle(text: "Web", systemName: "globe")
                    }.padding()
                }
                HStack {
                    Text("Info")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                }.padding(.horizontal)
                    .padding(.top)
                HStack {
                    NavigationLink(destination: HelpView()) {
                        DaisyButtonStyle(color: .accentColor,
                                         text: lc.text(.Hint),
                                         systemName: "questionmark.circle",
                                         type: .left)
                        .padding(.trailing, 5)
                    }
                    NavigationLink(destination: FeedbackView()) {
                        DaisyButtonStyle(color: .accentColor,
                                         text: lc.text(.Contact),
                                         systemName: "envelope",
                                         type: .left)
                        .padding(.leading, 5)
                    }
                }.padding(.horizontal)
                
                
                
                NewsView()
                
                PremiumButton()
                    .padding()
                
                Spacer()
            }
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
