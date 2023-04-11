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
                title: lc.text(.PremiumFunctionSectionTitle3),
                text: lc.text(.ChatDescription),
                systemName: "exclamationmark.triangle")
            PremiumFunctionCell(
                title: lc.text(.PremiumFunctionSectionTitle3),
                text: lc.text(.AlertDescription),
                systemName: "smiley")
        }
    }

}

struct PremiumFunctionSection_Previews: PreviewProvider {
    static var previews: some View {
        PremiumFunctionSection()
    }
}
