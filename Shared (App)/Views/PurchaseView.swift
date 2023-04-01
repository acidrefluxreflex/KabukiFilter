//
//  PurchaseView.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/26.
//

import SwiftUI

struct PurchaseView: View {
    
    private let lc = LocalizeCodes()
    @StateObject var model = PaymentModel()
    //@StateObject private var tracking = ATTrackingModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(lc.text(.MasterPlan))
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    PremiumPriceLabel()
                        .padding(.horizontal)
                    PremiumFunctionSection()
                        .padding(.vertical)
                    //.padding()
                    RestoreButton()
                        .padding(.bottom)
                    
                    PremiumTableImage(size: 350)
                     

                    Spacer(minLength: 200)

                }.padding()
            }
            PurchaseButton(action: {
                model.masterPurchase()
            })
            if model.isShowProgress {
                ActivityIndicator()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.orange)
                    .onDisappear {
                        dismiss()
                    }
            }
        }.onAppear {
            
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
