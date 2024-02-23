//
//  User.swift
//  Adab
//
//  Created by Abdullah Saad on 2/19/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
