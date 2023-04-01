//
//  MeditateView.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2023/03/28.
//

import SwiftUI

struct MeditateView: View {
    
    private let lc = LocalizeCodes()
    
    var body: some View {
    
            List {
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
}

struct MeditateView_Previews: PreviewProvider {
    static var previews: some View {
        MeditateView()
    }
}
