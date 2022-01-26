//
//  RecipesDetailedView.swift
//  Recipes App
//
//  Created by Vladyslav Brumar on 1/25/22.
//

import SwiftUI

struct RecipesDetailedView: View {
    
    // will rely on what user tap
    // at recipe list view
    var recipe: Recipe
    
    var body: some View {

        ScrollView {
            
            VStack(alignment: .leading) {
            
                
                
                // mark let us add directions in the menu in the top and go to through each like small sections in code
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingridients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    // Go to through each element from array and display it
                    ForEach (recipe.ingredients, id: \.self) { item in
                        Text("• " + item)
                            .padding(.bottom, 0.5)
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .navigationBarTitle(recipe.name)
        
    }
}

struct RecipesDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Have to do that things, because of that unset recipe at the view, to see the preview
        
        // Create a dummy recipe and pass it into the detail
        // view so that we can see preview
        let model = RecipeModel()
        
        RecipesDetailedView(recipe: model.recipes[0])
    }
}
