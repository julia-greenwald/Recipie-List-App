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
        
        VStack(alignment: .leading, spacing: 0){
            
            Text("Featured Recipe")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                
            
            GeometryReader {geo in
                TabView {
                    
                    // Loop through each recipe
                    ForEach (0..<model.recipes.count) { index in
                        
                        // Only hsow those that should be featured
                        if model.recipes[index].featured {
                            
                            // Recipe Card
                            ZStack {
                                Rectangle().foregroundColor(.white)
                                
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }
                            .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color:.green, radius:10, x:-5, y:5)
                        }
                        
                    }
                    
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack (alignment: .leading, spacing: 10){
                Text("Preparation Time: ")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding(.leading)
        }
        .padding(.leading)
        
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
