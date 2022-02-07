//
//  DataService.swift
//  Recipe List App
//
//  Created by greenwald_juj on 2/4/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        // Parse local json file
        
        // Get a ural path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Add guard statement to make sure path not nil
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        do {
            // Create a data object
            let data = try Data(contentsOf:url)
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                
                    // Add ID to ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                
                }
                return recipeData
            }
            catch {
                // Return the recipes
                print(error)
            }
        }
        catch {
            // error with json parsing
            print(error)
        }
        return [Recipe]()
    }
}
