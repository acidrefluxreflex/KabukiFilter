//
//  TabViewExtension.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/11/24.
//

import Combine
import Foundation

class MainTabBarData: ObservableObject {

    //let action: () -> Void
    /// This is the index of the item that fires a custom action
    let customActiontemindex: Int

    let objectWillChange = PassthroughSubject<MainTabBarData, Never>()

    var previousItem: Int

    var itemSelected: Int {
        didSet {
            if itemSelected == customActiontemindex {
                previousItem = oldValue
                itemSelected = oldValue
                isCustomItemSelected = true
            }
            objectWillChange.send(self)
        }
    }

    func reset() {
        itemSelected = previousItem
        objectWillChange.send(self)
    }

    /// This is true when the user has selected the Item with the custom action
    var isCustomItemSelected: Bool = false

    init(
        initialIndex: Int = 1,
        customItemIndex: Int
            //  action: @escaping () -> Void
    ) {
        self.customActiontemindex = customItemIndex
        self.itemSelected = initialIndex
        self.previousItem = initialIndex
        //  self .action = action
    }
}
