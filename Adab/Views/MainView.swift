//
//  ContentView.swift
//  Adab
//
//  Created by Abdullah Saad on 2/18/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //signed in
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ItemsView(userId: viewModel.currentUserId)
                .tabItem { Label( "Home", systemImage: "house") }
            
            ProfileView()
                .tabItem { Label("Home", systemImage: "person.circle") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
