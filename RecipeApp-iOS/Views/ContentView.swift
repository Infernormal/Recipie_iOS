
import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var groceryList: GroceryList
  
  var body: some View {
    switch viewModel.state {
      case .signedIn: HomeView(groceryList: groceryList)
      case .signedOut: LoginView()
    }
  }
    init(groceryList:GroceryList) {
        self.groceryList = groceryList
}

//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//  }
//}
}
