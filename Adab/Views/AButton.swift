//
//  AButton.swift
//  Adab
//
//  Created by Abdullah Saad on 2/19/24.
//

import SwiftUI

struct AButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct AButton_Previews: PreviewProvider {
    static var previews: some View {
        AButton(title: "Button Text", background: .brown) {
            //Action Passed Here
        }
    }
}
