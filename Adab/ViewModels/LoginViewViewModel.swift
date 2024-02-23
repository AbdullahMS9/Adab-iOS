//
//  LoginViewViewModel.swift
//  Adab
//
//  Created by Abdullah Saad on 2/19/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errMessage = ""
    
    init(){
        
    }
    
    func login(){
        guard validate() else{
            return
        }
        
        //Proceed to login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
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
        
        return true
    }
    
}
