//
//  TabSample.swift
//  KabukiFilter (iOS)
//
//  Created by Kabuki Iwashita on 2021/10/24.
//

import SwiftUI

struct TabSample: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
            Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
        }.tabViewStyle(.page)
    }
}

struct TabSample_Previews: PreviewProvider {
    static var previews: some View {
        TabSample()
    }
}
