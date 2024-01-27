//
//  LoginViewModel.swift
//  JetDevsHomeWork
//
//  Created by ihsan on 28/01/24.
//

import Foundation

class LoginViewModel {
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        // Logika autentikasi disini (bisa berupa panggilan jaringan, validasi, dll.)
        let isLoggedIn = true
        completion(isLoggedIn)
    }
}
