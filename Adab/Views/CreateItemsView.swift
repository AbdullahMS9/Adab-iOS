//
//  CreateItemsView.swift
//  Adab
//
//  Created by Abdullah Saad on 2/19/24.
//

import SwiftUI

struct CreateItemsView: View {
    @StateObject var viewModel = CreateItemsViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("Create Item")
                .font(.system(size:32))
                .bold()
                .padding(.top, 100)
            
            Form{
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                AButton(
                    title: "Save",
                    background: .pink
                ) {
                    if(viewModel.canSave){
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }

                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Enter a valid title and due date"))
            }
        }
    }
}

struct CreateItemsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemsView(newItemPresented: Binding(get: {
            return true
        }, set :{ _ in
    
        }))
    }
}
