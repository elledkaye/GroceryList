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
  @StateObject var viewModel = ContentViewModel()
    
    // We want to show the login screen only if user is not logged in
    // Other wise if the user is logged in we want to show their account screen which would be the home screen
    
    var body: some View {
        if viewModel.isSignedIn,
           !viewModel.currentUserId.isEmpty{
            HomeView()
            
        }else{
            
            LoginScreen()
        }
   
        
    }
}

#Preview {
    ContentView()
}
