import SwiftUI

struct DeleteAccountButton: View {

    @StateObject private var authController = AuthController()
    @State private var showingAlert = false

    var body: some View {
        Button("Delete Account") {
            showingAlert.toggle()
        }.alert("Delete Account", isPresented: $showingAlert) {
            Button("OK", role: .destructive) {
                authController.deleteUser()
            }
            Button("Cancel", role: .cancel) {

            }
        } message: {
            //Text("詳細メッセージ")
        }
    }

}

struct LogOutButton: View {

    @StateObject private var authController = AuthController()
    @State private var showingAlert: Bool = false

    var body: some View {
        Button("LogOut") {
            showingAlert.toggle()
        }.alert("LogOut", isPresented: $showingAlert) {
            Button("OK", role: .destructive) {
                authController.signOut()
            }
            Button("Cancel", role: .cancel) {
            }
        } message: {
        }
    }

}
struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogOutButton()
    }
}

