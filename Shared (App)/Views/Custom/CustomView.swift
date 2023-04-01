//
//  CustomView.swift
//  PureFilter
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        
        NavigationStack {
            
            List {
                NavigationLink(destination:  WordSection()) {
                    TextButtonStyle(title:"Word")
                }
                NavigationLink(destination:  SearchFilterSection()) {
                    TextButtonStyle(title:"Search")
                }
                NavigationLink(destination:  URLSection()) {
                    TextButtonStyle(title:"URL")
                }
            }.navigationTitle("Custom")
        }
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
