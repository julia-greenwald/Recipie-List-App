//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by greenwald_juj on 2/5/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe // unset because we want the list view to determine which view is shown
    
    var body: some View {
        
        ScrollView {
       
            VStack(alignment: .leading) {
               // MARK: Title
               
               // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top] , 5)
                    ForEach (recipe.ingredients) { item in
                        Text("• " + item.name)
//                    ForEach (recipe, id: \.self) { item in
//                            Text("• " + item)

                    }
                }
                .padding(.horizontal)
                // MARK: Divider
               
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(0..<recipe.directions.count, id: \.self) {index in
                        Text(String(index+1) + "•  " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
           }
           .padding(.horizontal)
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    //This is for the Previiew, so give fake example
    static var previews: some View {
        // Create a dummy recipe and passit nto the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
 
