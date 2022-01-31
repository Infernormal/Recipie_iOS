

import SwiftUI

struct RecipeCategoryListView: View {
    
    let categories: [RecipeCategoryViewModel]
    
    var body: some View {
        List(categories) { category in
            
            NavigationLink(destination: RecipeListScreen(recipeCategory: category).navigationTitle(category.name)) {
                RecipeCategoryCellView(recipeCategory: category)
            }
        }.listStyle(.plain)
    }
}

