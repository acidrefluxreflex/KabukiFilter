//
//  CustomView.swift
//  PureFilter
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import SwiftUI

struct CustomView: View {
    
    private let lc = LocalizeCodes()
    @StateObject private var manager = PaymentStateManager()
    var body: some View {
        
  
            List {
        
                if manager.isUserSubscribed {
                    linkSection()
                } else {
                    freeSection()
                }
            }.onAppear {
                manager.checkUserSubscribed()
            }
        
    }
    
    private func linkSection() -> some View{
        Section {
            NavigationLink(destination:  WordSection()) {
                TextButtonStyle(title: lc.text(.PremiumFunctionSectionTitle1),
                                text: lc.text(.WordDescription),
                                systemName: "textformat")
            }
            NavigationLink(destination:  SearchFilterSection()) {
                TextButtonStyle(title: lc.text(.PremiumFunctionSectionTitle2),
                                text: lc.text(.SearchDescription),
                                systemName: "magnifyingglass")
            }
            NavigationLink(destination:  URLSection()) {
                TextButtonStyle(title: lc.text(.PremiumFunctionSectionTitle3),
                                text: lc.text(.URLDescription),
                                systemName: "photo")
            }
        }
    }
    
    private func freeSection() -> some View{
        Section {
            NavigationLink(destination:  PurchaseView()) {
                TextButtonStyle(title: lc.text(.PremiumFunctionSectionTitle1),
                                text: lc.text(.WordDescription),
                                systemName: "textformat")
            }
            NavigationLink(destination:  PurchaseView()) {
                TextButtonStyle(title: lc.text(.PremiumFunctionSectionTitle2),
                                text: lc.text(.SearchDescription),
                                systemName: "magnifyingglass")
            }
            NavigationLink(destination:  PurchaseView()) {
                TextButtonStyle(title: lc.text(.PremiumFunctionSectionTitle3),
                                text: lc.text(.URLDescription),
                                systemName: "photo")
            }
        }
    }
    
    
    
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
