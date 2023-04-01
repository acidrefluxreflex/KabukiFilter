//
//  ContentView.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2021/10/28.
//

import SwiftUI

struct ContentView: View {

  @State private var selection: Int = 0

  var body: some View {
    NavigationStack {
      TabView(selection: $selection) {

        HomeView()
          .tabItem {
            iconItem(
              title: "Home",
              icon: "house")
          }.tag(0)

        CustomView().tabItem {
          iconItem(
            title: "Custom",
            icon: "wrench.and.screwdriver.fill")
        }.tag(1)

        MeditateView().tabItem {
          iconItem(
            title: "Meditate",
            icon: "heart.fill")
        }.tag(2)

        SettingView().tabItem {
          iconItem(
            title: "Setting",
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
