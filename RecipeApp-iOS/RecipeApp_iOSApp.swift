

import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn

@main
struct RecipeApp_iOSApp: App {
    @StateObject var viewModel = AuthenticationViewModel()
    
    // Have errors for this "self' used before all stored properties are initialized" and Return from initializer without initializing all stored propertie
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
//struct RecipeApp_iOSApp: App {
//
////    init() {
////        FirebaseApp.configure()
////    }
//    var body: some Scene {
//        WindowGroup {
//            LoginView()
////            ContentView()
//        }
//    }
//}
