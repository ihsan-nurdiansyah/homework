//
//  Login.swift
//  JetDevsHomeWork
//
//  Created by ihsan on 28/01/24.
//

import Foundation

struct Login {
    
    var email: String
    var password: String
}

struct User: Codable {
    
    let userId: Int
    let userName: String
    let userProfileURL: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case userName = "user_name"
        case userProfileURL = "user_profile_url"
        case createdAt = "created_at"
    }
}

struct UserData: Codable {
    
    let user: User
}

struct ApiResponse: Codable {
    
    let result: Int
    let data: UserData
}

func saveObject(_ object: User) {
    do {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            UserDefaults.standard.set(encoded, forKey: "userData")
        }
    }
}

func retrieveObject() -> User? {
    if let savedData = UserDefaults.standard.object(forKey: "userData") as? Data {
        let decoder = JSONDecoder()
        if let tmp = try? decoder.decode(User.self, from: savedData) {
            return tmp
        }
    }
    return nil
}
