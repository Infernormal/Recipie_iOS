

import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn

@main
struct RecipeApp_iOSApp: App {
    @StateObject var viewModel = AuthenticationViewModel()
    

    init() {
        setupAuthentication()
        for family in UIFont.familyNames.sorted() {
                    let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")}
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

