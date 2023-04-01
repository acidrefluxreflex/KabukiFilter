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
                text: lc.text(.WordDescription))
            PremiumFunctionCell(
                title: lc.text(.PremiumFunctionSectionTitle2),
                text: lc.text(.URLDescription))
            PremiumFunctionCell(
                title: lc.text(.PremiumFunctionSectionTitle3),
                text: lc.text(.SearchDescription))
            PremiumFunctionCell(
                title: lc.text(.PremiumFunctionSectionTitle3),
                text: lc.text(.ChatDescription))
            PremiumFunctionCell(
                title: lc.text(.PremiumFunctionSectionTitle3),
                text: lc.text(.AlertDescription))

        }
    }

}

struct PremiumFunctionSection_Previews: PreviewProvider {
    static var previews: some View {
        PremiumFunctionSection()
    }
}
