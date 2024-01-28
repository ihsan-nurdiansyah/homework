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
        completion: @escaping (Result<ApiResponse, Error>) -> Void) {
            let params: Parameters = [
                "email": email,
                "password": password
            ]
            ProgressHUD.show()
            AF.request("https://jetdevs.wiremockapi.cloud/login", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseDecodable(of: ApiResponse.self) { response in
                ProgressHUD.dismiss()
                switch response.result {
                case .success(let apiResponse):
                    completion(.success(apiResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
