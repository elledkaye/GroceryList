//
//  ContentView.swift
//  GroceryListApp
//
//  Created by Danielle Kaye on 8/13/24.
//
/*
 - What is the purpose of the ContentView?
 - What components need to be on here?
 - What functionality should be on here?
 - Does this view need validation?
 
 
 */
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("This should be pushed to dev branch")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
