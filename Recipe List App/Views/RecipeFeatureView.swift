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
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipe")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader {geo in
                TabView (selection: $tabSelectionIndex) {
//                TabView {
                    
                    // Loop through each recipe
                    ForEach (0..<model.recipes.count) { index in
                        
                        // Only show those that should be featured
                        if model.recipes[index].featured {
                            
                            // MARK: Recipe card button
                            Button (action: {
                                // Show the recipe Detail sheet
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                
                                // MARK: Recipe Card
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
                            })
                                .tag(index)
                                .sheet(isPresented: $isDetailViewShowing) {
                                    //                                    // Show the Recipe Detail View
                                    RecipeDetailView(recipe: model.recipes[index])
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color:.green, radius:10, x:-5, y:5)
                        } // End of if featured
                    } // End of ForEach
                } // End of Tab View
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }// end of georeader
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Preparation Time: ")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                //Text("test")
                Text("Highlights")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
//                Text("test")
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex() {
        // Find the index first recipie that is featured
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
