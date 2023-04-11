//
//  SettingView.swift
//  PureFilter
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import SwiftUI

struct SettingView: View {
    
    @State private var flag = false
    
    var body: some View {
        List {
            LogOutButton()
            DeleteAccountButton()
            #if DEBUG
            NavigationLink("test")  {
                ChatView()
            }
            #endif
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
