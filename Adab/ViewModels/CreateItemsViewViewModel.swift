//
//  CreateItemsViewViewModel.swift
//  Adab
//
//  Created by Abdullah Saad on 2/19/24.
//

import Foundation

class CreateItemsViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){ }
    
    func save() {
         
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
