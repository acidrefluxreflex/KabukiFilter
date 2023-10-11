//
//  CustomFilterModel.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2023/03/28.
//

import SwiftUI

class CustomFilterModel: ObservableObject {

    private let defaults = UserDefaults(suiteName: "group.example.wakaba.fruta")

    @Published var blockWords: [String] {
        didSet {
            defaults!.set(blockWords, forKey: "blockWord")
        }
    }

    @Published var rowBlock: [String] {
        didSet {
            defaults!.set(rowBlock, forKey: "rowBlock")
        }
    }

    @Published var blurSites: [String] {
        didSet {
            defaults!.set(blurSites, forKey: "blurSites")
        }
    }

    @Published var replaceSites: [String] {
        didSet {
            defaults!.set(replaceSites, forKey: "replaceSites")
        }
    }

    init() {
        blockWords = defaults!.object(forKey: "blockWord") as? [String] ?? ["sample"]
        rowBlock = defaults!.object(forKey: "rowBlock") as? [String] ?? ["sample333"]
        blurSites = defaults!.object(forKey: "blurSites") as? [String] ?? ["sample333"]
        replaceSites = defaults!.object(forKey: "replaceSites") as? [String] ?? ["sample333"]
    }
}
