//
//  AuthController.swift
//  PureFilter (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import AuthenticationServices
import CryptoKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation
import GoogleSignIn

class AuthController: ObservableObject {

  var currentNonce: String?
  @Published var isLogin: Bool = false
  //let repo = FireStoreRepositry()
  var auth = Auth.auth()
  @Published var userID: String = "error"

  func reloadUserID() {
    let user = Auth.auth().currentUser
    if let user = user {
      userID = user.uid
    }
  }

  @Published var userSession: Firebase.User?
  @Published var currentUser: User?

  //static let shared = AuthViewModel()

  func signIn(withEmail email: String, password: String) {
    auth.signIn(withEmail: email, password: password) { (result, error) in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      guard let user = result?.user else { return }

      print("userSession: \(user)")
      self.userSession = user
      //self.fetchUser()
    }
  }

  func signOut() {
    userSession = nil
    try? Auth.auth().signOut()
    print("sign out!")
  }

  func register(withEmail email: String, password: String, fullName: String) {
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
      if let error = error {
        print(error.localizedDescription)
        return
      }
    }
  }

  func gIDSignIn() {
    guard let clientID = FirebaseApp.app()?.options.clientID else { return }

    // Create Google Sign In configuration object.
    let config = GIDConfiguration(clientID: clientID)

    // Start the sign in flow!
    GIDSignIn.sharedInstance.signIn(
      with: config, presenting: (UIApplication.shared.windows.first?.rootViewController)!
    ) { user, error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      guard
        let authentication = user?.authentication,
        let idToken = authentication.idToken
      else {
        return
      }
      let credential = GoogleAuthProvider.credential(
        withIDToken: idToken,
        accessToken: authentication.accessToken)
      // Authenticate with Firebase using the credential object
      Auth.auth().signIn(with: credential) { (authResult, error) in
        if let error = error {
          print("authentication error \(error.localizedDescription)")
          return
        }
        print(authResult ?? "none")
      }
    }
  }

  func googleSignIn() {

    if GIDSignIn.sharedInstance.hasPreviousSignIn() {
      GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
        authenticateUser(for: user, with: error)
      }
    } else {
      // 2
      guard let clientID = FirebaseApp.app()?.options.clientID else { return }

      // 3
      let configuration = GIDConfiguration(clientID: clientID)

      // 4
      guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
      else { return }
      guard let rootViewController = windowScene.windows.first?.rootViewController else {
        return
      }

      // 5
      GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) {
        [unowned self] user, error in
        authenticateUser(for: user, with: error)
        print(error as Any)
      }
      //repo.uploadUserModel(userID: userSession?.uid ?? "")
    }

  }

  private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
    // 1
    if let error = error {
      print(error.localizedDescription)
      return
    }

    // 2
    guard let authentication = user?.authentication, let idToken = authentication.idToken else {
      return
    }

    let credential = GoogleAuthProvider.credential(
      withIDToken: idToken, accessToken: authentication.accessToken)

    // 3
    Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
      if let error = error {
        print(error.localizedDescription)
      } else {
        //self.state = .signedIn
      }
    }
  }

  private func appleTokenDelete() {
    let token = UserDefaults.standard.string(forKey: "refreshToken")
    if let token = token {
      let url = URL(
        string:
          "https://us-central1-reboot-e9671.cloudfunctions.net/revokeToken?refresh_token=\(token)"
          .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
          ?? "https://apple.com")!

      let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard data != nil else { return }
      }
      task.resume()
    }
  }

  func deleteUser() {
    let user = auth.currentUser
    user?.delete { error in
      if let error = error {
        print(error)
      } else {
        print("Account deleted.")
      }
    }
    self.appleTokenDelete()
  }

  func resetPassword(_ email: String) {
    auth.languageCode = "en"
    auth.sendPasswordReset(withEmail: email) { error in
      // ...
    }
  }

  private func checkEmailExist(
    email: String, completion: @escaping ((Result<Bool, Error>) -> Void)
  ) {
    // SignInの方法を取得するメソッドを使用
    Auth.auth().fetchSignInMethods(
      forEmail: email,
      completion: { (method, error) in
        if let err = error {
          completion(.failure(err))
          return
        }
        // すでにメールアドレスの認証などされている場合は
        // methodの中に"EmailLink"や"Email"などの認証方法が入る
        guard let method = method, !method.isEmpty else {
          // 何もない場合は存在しない
          completion(.success(false))
          return
        }
        // methodに認証方法が入っている場合は存在する判定
        completion(.success(true))
      })
  }

  func passwordCheck(_ password: String, confirm: String) -> Bool {
    var flag = false

    var isSafe = false
    var isConfirmed = false

    let passwordRegex =
      "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&amp;*()\\-_=+{}|?>.<,:;~`’]{6,}$"
    isSafe = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)

    isConfirmed = (password == confirm)

    if isSafe && isConfirmed {
      flag.toggle()
    }
    return flag
  }

  private func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    let hashString = hashedData.compactMap {
      return String(format: "%02x", $0)
    }.joined()

    return hashString
  }

  private func randomNonceString(length: Int = 32) -> String {
    precondition(length > 0)
    let charset: [Character] =
      Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
    var result = ""
    var remainingLength = length

    while remainingLength > 0 {
      let randoms: [UInt8] = (0..<16).map { _ in
        var random: UInt8 = 0
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
        if errorCode != errSecSuccess {
          fatalError(
            "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
          )
        }
        return random
      }

      randoms.forEach { random in
        if remainingLength == 0 {
          return
        }

        if random < charset.count {
          result.append(charset[Int(random)])
          remainingLength -= 1
        }
      }
    }

    return result
  }

}
