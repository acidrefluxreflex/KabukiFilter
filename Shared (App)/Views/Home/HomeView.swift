//
//  HomeView.swift
//  PureFilter
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {

            VStack {
                TimerView()
                NewsSection()
                NavigationLink(destination: HelpSection()) {
                    Text("Help")
                }
                Spacer()
            }.navigationBarTitle("Home")

        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
