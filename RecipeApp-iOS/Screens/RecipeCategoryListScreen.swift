

import SwiftUI

struct RecipeCategoryListScreen: View {
    
    @StateObject var model: RecipeCategoryListViewModel = RecipeCategoryListViewModel()
    
    var body: some View {
        NavigationView {
            RecipeCategoryListView(categories: $model.RecipeCategoryViewModel)
                .task {
                    await model.getData()
                }
            .navigationTitle("Recipes")
        }
    }
}

struct RecipeCategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryListScreen()
    }
}
