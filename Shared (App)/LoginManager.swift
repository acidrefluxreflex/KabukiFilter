//
//  LoginManager.swift
//  PureFilter (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/29.
//


import Firebase
import Foundation

class LoginManeger: ObservableObject {

    @Published var isLogin: Bool = false
    @Published var userID: String = ""
    let auth = AuthController()
   // let repo = FireStoreRepositry()

    var userSession: Firebase.User?

    func registerUser() {
        auth.reloadUserID()
        //repo.uploadUserModel(userID: auth.userID)
    }

    func loadID() {

        if userSession != nil {
            userID = userSession!.uid
        } else {
            userID = Date().description
        }

    }

}
