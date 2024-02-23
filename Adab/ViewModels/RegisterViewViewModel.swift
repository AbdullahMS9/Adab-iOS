//
//  RegisterViewViewModel.swift
//  Adab
//
//  Created by Abdullah Saad on 2/19/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errMessage = ""
    
    init(){
        
    }
    
    func register(){
        guard validate() else{
            return
        }
        
        //Proceed to register
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id,
                        name: name,
                        email: email,
                        joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate() -> Bool {
        errMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errMessage = "Please fill all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".")
        else {
            errMessage = "Please enter a valid email"
            return false
        }
        
        guard password.count >= 8
        else {
            errMessage = "Please enter a valid email"
            return false
        }
        
        return true
    }
    
    
    
}
