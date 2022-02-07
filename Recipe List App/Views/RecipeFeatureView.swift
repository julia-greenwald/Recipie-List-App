//
//  RecipeFeatureView.swift
//  Recipe List App
//
//  Created by greenwald_juj on 2/7/22.
//

import SwiftUI

struct RecipeFeatureView: View {
    // Reference the view model - doesn't make sense to create new model, have same recpe model instance poewring both feature and recipe list view.
//    @ObservedObject var model = RecipeModel()
    
    // Give Access to RecipeModel
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
    }
}
