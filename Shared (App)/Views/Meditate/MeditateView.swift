//
//  MeditateView.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2023/03/28.
//

import SwiftUI

struct MeditateView: View {
    
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
            NavigationLink(destination: PanicView()) {
                TextButtonStyle(title: lc.text(.PremiumFunctionSectionTitle5),
                                text: lc.text(.AlertDescription),
                                systemName: "exclamationmark.triangle")
            }
            NavigationLink(destination: ChatView()) {
                TextButtonStyle(title: lc.text(.PremiumFunctionSectionTitle4),
                                text: lc.text(.ChatDescription),
                                systemName: "smiley")
            }
        }
    }
    
    private func freeSection() -> some View{
        Section {
            NavigationLink(destination: PurchaseView()) {
                TextButtonStyle(title: lc.text(.PremiumFunctionSectionTitle5),
                                text: lc.text(.AlertDescription),
                                systemName: "exclamationmark.triangle")
            }
            NavigationLink(destination: PurchaseView()) {
                TextButtonStyle(title: lc.text(.PremiumFunctionSectionTitle4),
                                text: lc.text(.ChatDescription),
                                systemName: "smiley")
            }
        }
    }

}

struct MeditateView_Previews: PreviewProvider {
    static var previews: some View {
        MeditateView()
    }
}
