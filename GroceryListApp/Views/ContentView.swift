//
//  ContentView.swift
//  GroceryListApp
//
//  Created by Danielle Kaye on 8/13/24.
//

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
