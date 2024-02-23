//
//  LoginView.swift
//  Adab
//
//  Created by Abdullah Saad on 2/19/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title: "Adab",
                           subtitle: "Get things done right",
                           angle: 15,
                           background: .teal)
                
                //  Login Form
                Form{
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    AButton(title: "Log In", background: .blue) {
                        //Attempt Log In
                        viewModel.login()
                    }
                    
                    if !viewModel.errMessage.isEmpty {
                        Text(viewModel.errMessage)
                            .foregroundColor(Color.red)
                    }
                }
                .offset(y: -50)
                
                // Create Account
                VStack{
                    Text("New Around Here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
