//
//  RecipeListView.swift
//  Recipe List App
//
//  Created by greenwald_juj on 2/4/22.
//

import SwiftUI

struct RecipeListView: View {
    // Give Access to RecipeModel
    @EnvironmentObject var model:RecipeModel
    
    // Reference the ViewModel
    //        @ObservedObject var model = RecipeModel()
    
    var body: some View {
    
        NavigationView {
            List(model.recipes) {r in
                 
                NavigationLink(
                    destination: RecipeDetailView(recipe:r),
                    label: {
                        
                        // MARK: Row Item
                        HStack(spacing: 20) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped() //Clip any pieces outside the frame
                                .cornerRadius(5)
                            
                            VStack(alignment: .leading) {
                                Text(r.name)
                                    .foregroundColor(.black)
                                    .bold()
                                RecipeHighlights(highlights: r.highlights)
                                    .foregroundColor((.black))
                                    
                            }
                        }
                })
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
