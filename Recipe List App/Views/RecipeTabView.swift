//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by greenwald_juj on 2/7/22.
//

import SwiftUI

struct RecipeTabView: View {
    @State var tabIndex = 2
    var body: some View {
        TabView {
            Text("Featured View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(2)
            
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
