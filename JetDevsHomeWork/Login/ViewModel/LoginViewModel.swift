//
//  LoginViewModel.swift
//  JetDevsHomeWork
//
//  Created by ihsan on 28/01/24.
//

import Foundation
import Alamofire
import ProgressHUD

protocol LoginViewModelDelegate: AnyObject {
    func showAlert(title: String, message: String)
}

class LoginViewModel {
    
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<LoginResponse, Error>) -> Void) {
            let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
            ProgressHUD.show()
        AF.request("https://jetdevs.wiremockapi.cloud/login",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default
        )
        .validate(statusCode: 200..<500)
        .validate(contentType: ["application/json", "text/plain"])
        .responseDecodable(of: LoginResponse.self) { response in
            ProgressHUD.dismiss()
            switch response.result {
            case .success(let loginResponse):
                completion(.success(loginResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
