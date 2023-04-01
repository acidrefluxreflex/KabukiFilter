//
//  AppleLoginButton.swift
//  PureFilter (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/29.
//
//


import AuthenticationServices
import CryptoKit
import Firebase
import FirebaseAuth
import SwiftUI

struct AppleAuthButton: View {

    @State var currentNonce: String?
    //let repo = FireStoreRepositry()
    @State private var isComplete: Bool = false
    @ObservedObject var manager: LoginManeger = LoginManeger()

    var body: some View {
        ZStack {

            SignInWithAppleButton(

                //Request
                onRequest: { request in
                    let nonce = randomNonceString()
                    currentNonce = nonce
                    request.requestedScopes = [.fullName, .email]
                    request.nonce = sha256(nonce)
                },

                //Completion
                onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        switch authResults.credential {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:

                            guard let nonce = currentNonce else {
                                fatalError(
                                    "Invalid state: A login callback was received, but no login request was sent."
                                )
                            }
                            guard let appleIDToken = appleIDCredential.identityToken else {
                                fatalError(
                                    "Invalid state: A login callback was received, but no login request was sent."
                                )
                            }
                            guard let idTokenString = String(data: appleIDToken, encoding: .utf8)
                            else {
                                print(
                                    "Unable to serialize token string from data: \(appleIDToken.debugDescription)"
                                )
                                return
                            }

                            //https://us-central1-reboot-e9671.cloudfunctions.net/revokeToken

                            // Add new code below
                            if let authorizationCode = appleIDCredential.authorizationCode,
                                let codeString = String(data: authorizationCode, encoding: .utf8)
                            {

                                let url = URL(
                                    string:
                                        "https://us-central1-reboot-e9671.cloudfunctions.net/getRefreshToken?code=\(codeString)"
                                        .addingPercentEncoding(
                                            withAllowedCharacters: .urlQueryAllowed)
                                        ?? "https://apple.com")!

                                let task = URLSession.shared.dataTask(with: url) {
                                    (data, response, error) in

                                    if let data = data {
                                        let refreshToken = String(data: data, encoding: .utf8) ?? ""
                                        print(refreshToken)
                                        // *For security reasons, it is recommended to store in Firestore rather than UserDefaults.
                                        UserDefaults.standard.set(
                                            refreshToken, forKey: "refreshToken")
                                        UserDefaults.standard.synchronize()
                                    }
                                }
                                task.resume()

                            }

                            let credential = OAuthProvider.credential(
                                withProviderID: "apple.com",
                                idToken: idTokenString,
                                rawNonce: nonce)

                            UserDefaults.standard.set(idTokenString, forKey: "appleIDToken")
                            print("idTokenString:\(idTokenString)")
                            print("idTokenString:\(idTokenString)")

                            Auth.auth().signIn(with: credential) { (authResult, error) in
                                if error != nil {
                                    // Error. If error.code == .MissingOrInvalidNonce, make sure
                                    // you're sending the SHA256-hashed nonce as a hex string with
                                    // your request to Apple.
                                    print(error?.localizedDescription as Any)

                                    return
                                }
                                print("signed in")
                                isComplete.toggle()
                            }

                            print("\(String(describing: Auth.auth().currentUser?.uid))")
                            let currentUser = Firebase.User.self
                            if currentUser != nil {

                                UserDefaults.standard.set("", forKey: "appleIDToken")
                                manager.isLogin.toggle()
                            }

                        default:
                            break

                        }
                    default:
                        break
                    }

                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.primary, lineWidth: 1)
            ).background(
                Color(.black)
                    .cornerRadius(5)
            )

            //.shadow(color: .black, radius: 2, x: 2, y: 2)
            .frame(height: 60)

        }

    }

    //Hashing function using CryptoKit
    private func sha256(_ input: String) -> String {
        let inputData: Data = Data(input.utf8)
        let hashedData: SHA256.Digest = SHA256.hash(data: inputData)
        let hashString: String = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()

        return hashString
    }

    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result: String = ""
        var remainingLength: Int = length

        while remainingLength > 0 {
            let randoms: [UInt8] = (0..<16).map { _ in
                var random: UInt8 = 0
                let errorCode: Int32 = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
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

struct AppleAuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleAuthButton()
    }
}


