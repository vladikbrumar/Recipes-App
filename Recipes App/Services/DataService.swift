//
//  DataService.swift
//  Recipes App
//
//  Created by Vladyslav Brumar on 1/25/22.
//

import Foundation

class DataService {
    
    func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // guard statement, check if something nor a nil and do then smth
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
  
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
 
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                // there is .self to refer it is a data type
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            } catch {
                print("error with decoding data from json")
                // print(error)
            }
   
     
        } catch {
            // error with getting data
            print("Error with getting data")
            // print(error)
        }
        
        return [Recipe]()
        
    }
    
}
