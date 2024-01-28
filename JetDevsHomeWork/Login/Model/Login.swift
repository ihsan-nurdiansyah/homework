//
//  Login.swift
//  JetDevsHomeWork
//
//  Created by ihsan on 28/01/24.
//

import Foundation

struct User {
    var email: String
    var password: String
}

struct LoginResponse: Codable {
    var token: String
}
