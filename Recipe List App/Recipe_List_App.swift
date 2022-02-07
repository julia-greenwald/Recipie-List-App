//
//  Recipe_List_App.swift
//  Recipe List App
//
//  Created by greenwald_juj on 1/18/22.
//


import SwiftUI

@main

struct Recipe_List_App: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
        }
    }
}
