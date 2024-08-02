//
//  ItemsView.swift
//  Adab
//
//  Created by Abdullah Saad on 2/19/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ItemsView: View {
    @StateObject var viewModel = ItemsViewViewModel()
    @FirestoreQuery var items : [ToDoListItem]

    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Items List
                List(items){ item in
                    Text(item.title)
                }
                .listStyle(PlainListStyle())
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
        ItemsView(userId: "1b11rk3OjiT8mznvfIwDC9hYA9z1")
    }
}
