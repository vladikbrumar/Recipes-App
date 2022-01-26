//
//  ContentView.swift
//  Recipes App
//
//  Created by Vladyslav Brumar on 1/25/22.
//

import SwiftUI

struct RecipesView: View {
    
    // Reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) { recipe in
                
                NavigationLink(
                    destination: RecipesDetailedView(recipe: recipe),
                    label: {
                        // MARK: Row item
                        HStack(spacing: 20.0) {
                            Image(recipe.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(recipe.name)
                        }
                })
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
