//
//  FeedbackStar.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/01/16.
//

import SwiftUI

struct FeedbackStar: View {
    
    @Binding var rating: Int
    

    var label = ""

    var maximumRating = 5

    var offImage: Image = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.accentColor
    
    var body: some View {
        
        HStack {
            
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage
        } else {
            return onImage
        }
    }
    
}

struct FeedbackStar_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackStar(rating: .constant(2))
    }
}
