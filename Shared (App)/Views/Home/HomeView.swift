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
        
        ScrollView {
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
            }.padding()
            TimerView()
                .padding(.horizontal)
            
            NewsView()
            
            PremiumButton()
                .padding()
            
            Spacer()
        }
        
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
