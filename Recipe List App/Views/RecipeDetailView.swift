//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by greenwald_juj on 2/5/22.


// No reference to instance model, but recipe detail view is child of recipe list view. only need it to call getPortion.

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe // unset because we want the list view to determine which view is shown
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
       
            VStack(alignment: .leading) {
               // MARK: Title
               
               // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.leading)
                    .padding(.top, 20)
                    .font(.largeTitle)
                
                // MARK: Serving Size picker
                VStack {
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top] , 5)
                    
                    ForEach (recipe.ingredients) { item in
//                        Text("• " + item.name)
//                    ForEach (recipe, id: \.self) { item in
//                            Text("• " + item)
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())

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
//        .navigationBarTitle(recipe.name)
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
 
