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
    
    // Making it static, it can be called without creating a new instance
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
    
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // Get a signel serving size by multiple the denominator by the recipe servings.
            denominator *= recipeServings
            // Get target portion by mulitplying numerator by target servings
            numerator *= targetServings
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
        
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                //Calcualted whole portions
                wholePortions = numerator / denominator
                //Calculate the remainder
                numerator = numerator % denominator
                //Assign to portion string
                portion += String(wholePortions)
                
            }
            
            // Express the remaineder as fraction
            if numerator > 0 {
                // Assign reminador as fracion to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator) "
                
            }
            
        }
        
        if var unit = ingredient.unit {
            
            // If we need to pluralize
            if wholePortions > 1 {
                
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit = "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            // Calculate appropriate suffix
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
            
        }
        return portion
    }
    
}
