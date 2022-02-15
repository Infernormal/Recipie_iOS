

import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn

@main
struct RecipeApp_iOSApp: App {
    @StateObject var viewModel = AuthenticationViewModel()
    

    init() {
        setupAuthentication()

    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

extension RecipeApp_iOSApp {
    private func setupAuthentication() {
        FirebaseApp.configure()
    }
}

