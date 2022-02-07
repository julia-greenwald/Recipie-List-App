//
//  Recipes.swift
//  Recipe List App
//
//  Created by greenwald_juj on 2/4/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Parse the local json file
        //Set the recipe 
    
        // Create an instance of data service and get the data.
        self.recipes = DataService.getLocalData()
    }
    
}
