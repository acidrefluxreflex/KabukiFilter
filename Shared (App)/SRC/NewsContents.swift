//
//  NewsContents.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2023/03/28.
//

import SwiftUI


struct NewsContent: View {
    
    @State private var model: NewsModel
    
    init(model: NewsModel = NewsModel()) {
        self.model = model
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 5) {
                Rectangle().frame(width: 5, height: 20)
                    .foregroundColor(.accentColor)
                Text(model.title)
                    .fontWeight(.medium)
            }
            HStack {
                Text(model.body)
                    .font(.caption)
                Spacer()
            }
            HStack {
                Image(systemName: "clock")
                Text(model.date.formatted(.dateTime.day().month()))
            } .font(.caption)
                .foregroundColor(.secondary)
              
        }.padding()
        .background(
            Color.theme(.ThemeGray)
                .cornerRadius(8)
        )
    }
}




struct NewsContents_Previews: PreviewProvider {
    static var previews: some View {
        NewsContent()
    }
}


