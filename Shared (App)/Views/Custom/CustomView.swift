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
            NavigationLink(destination:  RowCustomView()) {
                Text("RowCustom")
            }
            NavigationLink(destination:  WordSection()) {
                Text("Word")
            }
            NavigationLink(destination:  SearchFilterSection()) {
                Text("Search")
            }
            NavigationLink(destination:  URLSection()) {
                Text("URl")
            }
        }
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
