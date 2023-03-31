//
//  GoogleLoginButton.swift
//  PureFilter (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

//
//  GoogleAuthButton.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/10/24.
//

import Firebase
import GoogleSignIn
import SwiftUI

struct GoogleAuthButton: View {

    @StateObject private var auth = AuthController()
    @ObservedObject var manager: LoginManeger = LoginManeger()
    
    let gBlue = Color(hex: "#4285F4")

    var body: some View {
        Button(action: {
            gIDSignIn()
        }) {
            buttonLabel

        }.buttonStyle(.plain)
    }

    private var buttonLabel: some View {
        HStack {
            Spacer()
            Image(systemName: "g.circle.fill")
                
            Text("Sign in with Google")
                .font(.title2)
            Spacer()
        }.foregroundColor(.white)
        .frame(height: 60)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(.secondary, lineWidth: 1)
        )
        .background(
           gBlue
                .cornerRadius(5)
        )
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
                print(error)
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
        manager.isLogin.toggle()
    }

}

struct GoogleAuthButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleAuthButton()
            .padding()
    }
}

