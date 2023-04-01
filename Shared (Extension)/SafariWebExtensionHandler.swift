//
//  SafariWebExtensionHandler.swift
//  Shared (Extension)
//
//  Created by Kabuki Iwashita on 2021/10/28.
//

import SafariServices
import os.log

let SFExtensionMessageKey = "message"
let ExtensionRowKey = "rowMessage"


class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {
    
    let defaults = UserDefaults(suiteName: "group.example.wakaba.fruta")
    

    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let message = item.userInfo?[SFExtensionMessageKey]
        os_log(.default, "Received message from browser.runtime.sendNativeMessage: %@", message as! CVarArg)
        let response = NSExtensionItem()
        
        //response.userInfo = [ SFExtensionMessageKey: [ "Response to": message ] ]
        
        let rowBlock = defaults!.object(forKey: "rowBlock") as? [String] ?? ["example.com🤖"]
        response.userInfo = [ ExtensionRowKey: [ "rowBlock": rowBlock ] ]
        
        let blurSites = defaults!.object(forKey: "blurSites") as? [String] ?? ["example.com🐍"]
        let replaceSites = defaults!.object(forKey: "replaceSites") as? [String] ?? ["example.com🐍"]
        
        
        let blockWord = defaults!.object(forKey: "blockWord") as? [String] ?? ["example.com🐍"]
        response.userInfo = [ SFExtensionMessageKey: [
            "blockWord": blockWord,
            "rowBlock": rowBlock,
            "blurSites": blurSites,
            "replaceSites" : replaceSites
        ] ]

        context.completeRequest(returningItems: [response], completionHandler: nil)
    }

}
