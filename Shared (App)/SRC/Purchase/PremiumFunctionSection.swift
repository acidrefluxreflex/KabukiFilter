//
//  PremiumFunctionSection.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/02/21.
//

import SwiftUI

struct PremiumFunctionSection: View {

    private let lc = LocalizeCodes()

    var body: some View {
        VStack(alignment: .leading) {
            PremiumFunctionCell(
                title: lc.text(.PremiumFunctionSectionTitle1),
                text: lc.text(.WordDescription),
                systemName: "textformat")
            PremiumFunctionCell(
                title: lc.text(.PremiumFunctionSectionTitle2),
                text: lc.text(.URLDescription),
                systemName: "photo")
            PremiumFunctionCell(
                title: lc.text(.PremiumFunctionSectionTitle3),
                text: lc.text(.SearchDescription),
                systemName: "magnifyingglass")
            PremiumFunctionCell(
                title: lc.text(.PremiumFunctionSectionTitle4),
                text: lc.text(.ChatDescription),
                systemName: "smiley")
            PremiumFunctionCell(
                title: lc.text(.PremiumFunctionSectionTitle5),
                text: lc.text(.AlertDescription),
                systemName: "exclamationmark.triangle")
            if lc.text(.Language) == "日本語" {
                PremiumFunctionCell(
                    title: "自分へのプレッシャー",
                    text: "お金を無駄にしたくない気持ちで継続できるかもしれません",
                    systemName: "dollarsign")
            }
        }
    }

}

struct PremiumFunctionSection_Previews: PreviewProvider {
    static var previews: some View {
        PremiumFunctionSection()
    }
}
