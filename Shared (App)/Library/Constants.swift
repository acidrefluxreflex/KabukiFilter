//
//  Constants.swift
//  AppleSample (macOS)
//
//  Created by Kabuki Iwashita on 2021/10/12.
//

import Foundation

/*
 Configuration file for your app's RevenueCat settings.
 */

struct Constants {

    /*
     The API key for your app from the RevenueCat dashboard: https://app.revenuecat.com
     */
    //#error("Modify this property to reflect your app's API key, then comment this line out.")
    static let apiKey = "appl_yTiWemQEBMYeWGcacywfuwqEpzE"

    /*
     The entitlement ID from the RevenueCat dashboard that is activated upon successful in-app purchase for the duration of the purchase.
     */
    //#error("Modify this property to reflect your app's entitlement identifier, then comment this line out.")
    let entitlementID = "MasterPlan"

    let entitlementID_Pro = "ProSubscription"
    let entitlementID_Lite = "LiteSubscription"

    let productID_Pro = "Reboot_Pro"
    let productID_Lite = "Reboot_Lite"
    
    let productID_Master = "master_monthly_pure"

}
