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
                TimerView()
                    .padding(.horizontal)
                /*
                NewsSection()
                 */
               PremiumButton()
                    .padding()
                NavigationLink(destination: HelpSection()) {
                    DaisyButtonStyle(text: lc.text(.Hint))
                        .padding()
                }
                Spacer()
            }

        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
