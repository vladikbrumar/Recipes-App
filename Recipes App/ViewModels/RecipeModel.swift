//
//  RecipeModel.swift
//  Recipes App
//
//  Created by Vladyslav Brumar on 1/25/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()

    init(){
        
        // Create an instance of data service and get the data
        let service = DataService()
        self.recipes = service.getLocalData()
        
        // shortcut if using instance only once
        // self.recipes = DataService().getLocalData()
        
        // if method getLocalData is static
        // self.recipes = DataService.getLocalData()
        
        // Set the recipe property
        
        
    }
}
