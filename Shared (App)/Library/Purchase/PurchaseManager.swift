//
//  PaymentModel.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/10/24.
//

import CoreData
import Foundation
import RevenueCat
import SwiftUI

class PurchaseService {

    static func purchase(productId: String?, successfulPurchase: @escaping () -> Void) {

        guard productId != nil else {
            return
        }
    }

    static func restore(productId: String?, successfulPurchase: @escaping () -> Void) {

        guard productId != nil else {
            return
        }
    }
}

class PaymentModel: ObservableObject {

    @Published var isShowProgress = false
    @Published var isPurchase = false
    
    @Published var isUserSubscribed = false

     let defaultsKey = "Purchase"
    private let litePlanID: String = "LitePlan_Monthly"
    private let proPlanID: String = "ProPlan_Monthly"
    private let productId: String = "master_monthly_pure"
    @Published var userPurchases = [String: Bool]()

    private let constants = Constants()

    private let shared = Purchases.shared
    
    func checkUserSubscribed() {
            // Purchases.shared.purchaserInfoを使用してユーザーの課金情報を取得する
           Purchases.shared.getCustomerInfo { (info, error) in
                if let error = error {
                    // エラーが発生した場合はログに出力する
                    print(error.localizedDescription)
                    print("👩‍🦱")
                    return
                }
                
                guard let info = info else { return }
                
                // ユーザーが購読済みの場合はisUserSubscribedをtrueにする
               if info.entitlements.all[self.constants.entitlementID]?.isActive == true {
                    self.isUserSubscribed = true
                } else {
                    self.isUserSubscribed = false
                }
            }
        }

    func masterPurchase() {
        isShowProgress.toggle()
        let productId = constants.productID_Master
        PaymentModel.purchase(productId: productId) {
            self.userPurchases[productId] = true
            self.isShowProgress = false

        } cancelPurchase: {
            self.isShowProgress = false
        }

        if isShowProgress == false {

        }
        UserDefaults.standard.set(productId, forKey: defaultsKey)
    }

    func litePurchase() {
        isShowProgress.toggle()
        let productId = constants.productID_Lite

        PaymentModel.purchase(productId: productId) {
            self.userPurchases[productId] = true
            self.isShowProgress = false

        } cancelPurchase: {
            self.isShowProgress = false
        }

        if isShowProgress == false {

        }
        UserDefaults.standard.set(productId, forKey: "Purchase")
    }

    
    
    func proPurchase() {
        isShowProgress.toggle()
        let productId = constants.productID_Pro

        PaymentModel.purchase(productId: productId) {
            self.userPurchases[productId] = true
            self.isShowProgress = false
        } cancelPurchase: {
            self.isShowProgress = false
        }

        if isShowProgress == false {

        }
        UserDefaults.standard.set(productId, forKey: "Purchase")
    }

    func liteRestore() {

        let productId = constants.productID_Lite

        PaymentModel.restore(productId: productId) {
            self.userPurchases[productId] = true
            self.isShowProgress = false

        } cancelRestore: {
            self.isShowProgress = false
        }
    }

    func proRestore() {

        let productId = constants.productID_Pro

        PaymentModel.restore(productId: productId) {
            self.userPurchases[productId] = true
            self.isShowProgress = false

        } cancelRestore: {
            self.isShowProgress = false
        }
    }
    
    func masterRestore() {

        let productId = constants.productID_Master

        PaymentModel.restore(productId: productId) {
            self.userPurchases[productId] = true
            self.isShowProgress = false

        } cancelRestore: {
            self.isShowProgress = false
        }
    }


    func offShowProgress() {
        self.isShowProgress = false
    }

    static func purchase(
        productId: String, successfulPurchase: @escaping () -> Void,
        cancelPurchase: @escaping () -> Void
    ) {

        Purchases.shared.getProducts([productId]) { (products) in
            if !products.isEmpty {

                let skProduct = products[0]

                Purchases.shared.purchase(product: skProduct) {
                    (transaction, purchaserInfo, error, userCancelled) in
                    if error == nil && !userCancelled {
                        // successful purchase
                        successfulPurchase()
                    }
                    if userCancelled {
                        cancelPurchase()
                    }
                }
            }
        }

    }

    static func restore(
        productId: String, successfulrestore: @escaping () -> Void,
        cancelRestore: @escaping () -> Void
    ) {

        Purchases.shared.getProducts([productId]) { (products) in

            if !products.isEmpty {

                Purchases.shared.restorePurchases { (purchaserInfo, _) in

                    print("purchaserInfo🇼🇫 ↓")
                    if purchaserInfo!.entitlements.all[productId]?.isActive == true {
                        successfulrestore()
                        print("Active")
                    } else {
                        cancelRestore()
                        print("InActive")

                    }

                }
            }
        }
    }

    func getStatus() {

        let entitlementID_Pro = constants.entitlementID_Pro
        let entitlementID_Lite = constants.entitlementID_Lite

        let productId_Lite = constants.productID_Lite
        let productId_Pro = constants.productID_Pro

        Purchases.shared.getCustomerInfo { (purchaserInfo, error) in
            if purchaserInfo?.entitlements[entitlementID_Lite]?.isActive == true {
                //課金ユーザーかどうかの判定
                //purchaseText = "true"
                UserDefaults.standard.set(productId_Lite, forKey: "Purchase")
            } else if purchaserInfo?.entitlements[entitlementID_Pro]?.isActive == true {
                //課金ユーザーかどうかの判定
                //purchaseText = "true"
                UserDefaults.standard.set(productId_Pro, forKey: "Purchase")
            } else {
                //purchaseText = "false"
                UserDefaults.standard.set("FreePlan", forKey: "Purchase")
                print("user isn't premium user")
            }
        }
    }

}

/*
 import Purchases

 // Configure Purchases SDK
 Purchases.configure(withAPIKey: "your_api_key")

 // Check if the user has an active subscription
 Purchases.shared.purchaserInfo { (info, error) in
 if let error = error {
 print("Error: \(error.localizedDescription)")
 return
 }

 guard let info = info else {
 print("No purchaser info")
 return
 }

 if info.entitlements.all["your_entitlement_id"]?.isActive == true {
 // User has an active subscription
 print("User has an active subscription")
 } else {
 // User doesn't have an active subscription
 print("User doesn't have an active subscription")
 }
 }

 // Restore purchases
 Purchases.shared.restoreTransactions { (info, error) in
 if let error = error {
 print("Error: \(error.localizedDescription)")
 return
 }

 guard let info = info else {
 print("No purchaser info")
 return
 }

 if info.entitlements.all["your_entitlement_id"]?.isActive == true {
 // User has an active subscription
 print("User has an active subscription")
 } else {
 // User doesn't have an active subscription
 print("User doesn't have an active subscription")
 }
 }




enum PurchasesError: Error {
    case noPurchaserInfo
    case invalidEntitlementID
}

class SubscriptionManager: NSObject, ObservableObject {

    static let shared = SubscriptionManager()

    @Published var isUserSubscribed = false

    override private init() {
        super.init()

        // Configure Purchases SDK
        Purchases.configure(withAPIKey: "your_api_key")

        // Check if the user has an active subscription
        Purchases.shared.purchaserInfo { [weak self] (info, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let info = info else {
                print("No purchaser info")
                return
            }

            if info.entitlements.all["your_entitlement_id"]?.isActive == true {
                // User has an active subscription
                self.isUserSubscribed = true
            } else {
                // User doesn't have an active subscription
                self.isUserSubscribed = false
            }
        }
    }

    func checkUserSubscribed(completion: @escaping (Result<Bool, PurchasesError>) -> Void) {
        // Check if the user has an active subscription
        Purchases.shared.purchaserInfo { (info, error) in
            if let error = error {
                completion(.failure(.noPurchaserInfo))
                return
            }

            guard let info = info else {
                completion(.failure(.noPurchaserInfo))
                return
            }

            if info.entitlements.all["your_entitlement_id"]?.isActive == true {
                // User has an active subscription
                completion(.success(true))
            } else {
                // User doesn't have an active subscription
                completion(.success(false))
            }
        }
    }

    func restorePurchases(completion: @escaping (Result<Bool, PurchasesError>) -> Void) {
        // Restore purchases
        Purchases.shared.restoreTransactions { (info, error) in
            if let error = error {
                completion(.failure(.noPurchaserInfo))
                return
            }

            guard let info = info else {
                completion(.failure(.noPurchaserInfo))
                return
            }

            if info.entitlements.all["your_entitlement_id"]?.isActive == true {
                // User has an active subscription
                completion(.success(true))
            } else {
                // User doesn't have an active subscription
                completion(.success(false))
            }
        }
    }

    func subscribe(completion: @escaping (Result<Bool, PurchasesError>) -> Void) {
        guard let offering = Purchases.shared.offerings().current,
              let package = offering.availablePackages.first else {
            completion(.failure(.invalidEntitlementID))
            return
        }

        // Purchase a subscription
        Purchases.shared.purchasePackage(package) { (transaction, info, error, userCancelled) in
            if let error = error {
                completion(.failure(.noPurchaserInfo))
                return
            }

            guard let info = info else {
                completion(.failure(.noPurchaserInfo))
                return
            }

            if info.entitlements.all["your_entitlement_id"]?.isActive == true {
                // User has an active subscription
                completion(.success(true))
            } else {
                // User doesn't have an active subscription
                completion(.success(false))
            }
        }
    }

    func unsubscribe(completion: @escaping (Result<Bool, PurchasesError>) -> Void) {
        // User wants to cancel subscription

        // Get the user's Entitlements
        guard let entitlement = Purchases.shared.entitlements.all["your_entitlement_id"],
              let subscription = entitlement.activeSubscription else {
            completion(.failure(.invalidEntitlementID))
            return
        }

        // Cancel the subscription
        subscription.cancel { (info, error) in
            if let error = error {
                completion(.failure(.noPurchaserInfo))
                return
            }

            guard let info = info else {
                completion(.failure(.noPurchaserInfo))
                return
            }

            if info.entitlements.all["your_entitlement_id"]?.isActive == false {
                // Subscription has been successfully canceled
                completion(.success(true))
            } else {
                // Subscription cancellation failed
                completion(.success(false))
            }
        }
    }

    func manageSubscriptions() {
        // User wants to manage subscriptions
        Purchases.shared.presentCodeRedemptionSheet()
    }

}
 */
