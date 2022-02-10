

import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn

@main
struct RecipeApp_iOSApp: App {
    @StateObject var viewModel = AuthenticationViewModel()
    @State var groceryList: GroceryList
    
    // Have errors for this "self' used before all stored properties are initialized" and Return from initializer without initializing all stored propertie
    init() {
        setupAuthentication()
    }
    init(groceryList:GroceryList) {
        self.groceryList = groceryList
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(groceryList: groceryList)
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
