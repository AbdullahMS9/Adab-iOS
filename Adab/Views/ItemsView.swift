//
//  ItemsView.swift
//  Adab
//
//  Created by Abdullah Saad on 2/19/24.
//

import SwiftUI

struct ItemsView: View {
    @StateObject var viewModel = ItemsViewViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Items Menu")
            .toolbar {
                Button {
                    //action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                CreateItemsView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView(userId: "")
    }
}
