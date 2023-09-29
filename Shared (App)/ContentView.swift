//
//  ContentView.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2021/10/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 0
    
    private let lc = LocalizeCodes()
    
    private let dic: [Int: String] = [
          0: "HOME".localized,
          1: "CUSTOM".localized,
          2: "MEDITATE".localized,
          3: "SETTING".localized,
      ]

    
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                
                HomeView()
                    .tabItem {
                        iconItem(
                            title: lc.text(.Home).localized,
                            icon: "house")
                    }.tag(0)
                
                CustomView().tabItem {
                    iconItem(
                        title: lc.text(.Custom),
                        icon: "wrench.and.screwdriver.fill")
                }.tag(1)
                
                MeditateView().tabItem {
                    iconItem(
                        title: lc.text(.Meditate),
                        icon: "heart.fill")
                }.tag(2)
                
                SettingView().tabItem {
                    iconItem(
                        title: lc.text(.Setting),
                        icon: "gearshape")
                }.tag(3)
                
            }
        }
    }
    
    private func iconItem(title: String, icon: String) -> some View {
        VStack {
            Text(title)
            Image(systemName: icon)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
