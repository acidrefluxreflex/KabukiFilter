//
//  SafariSheetview.swift
//  KabukiFilter
//
//  Created by Kabuki Iwashita on 2023/10/04.
//

import SwiftUI
import SafariServices

struct SafariSheetView: View {
    
    @State private var flag = false
    
    private var url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSdOTFqKlouaXhtFZsuit3LrpKBrafMUlOHH1h1Uisg0D48O6w/viewform?usp=sf_link")
    
    var body: some View {
        VStack {
            Button("test") {
                flag.toggle()
            }.sheet(isPresented: $flag) {
                SafariWebView(url: url!)
            }
        }
    }
}

struct SafariWebView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}

struct SafariSheetview_Previews: PreviewProvider {
    static var previews: some View {
        SafariSheetView()
    }
}
