//
//  LoginManeger.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/10/31.
//

import Firebase
import Foundation

class LoginManeger: ObservableObject {

    @Published var isLogin: Bool = false
    @Published var userID: String = ""
    let auth = AuthController()


    var userSession: Firebase.User?

    func registerUser() {
        auth.reloadUserID()
       
    }

    func loadID() {

        if userSession != nil {
            userID = userSession!.uid
        } else {
            userID = Date().description
        }

    }

}
