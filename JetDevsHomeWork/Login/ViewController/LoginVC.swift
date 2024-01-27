//
//  LoginVC.swift
//  JetDevsHomeWork
//
//  Created by ihsan on 28/01/24.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var emailErrorView: UIView!
    @IBOutlet weak var passwordErrorView: UIView!
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let closeTap = UITapGestureRecognizer(target: self, action: #selector(dismissScreen))
        closeView.isUserInteractionEnabled = true
        closeView.addGestureRecognizer(closeTap)
        
        emailErrorView.isHidden = true
        passwordErrorView.isHidden = true
    }
    
    @objc func dismissScreen() {
        self.dismiss(animated: true)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTxt.text,
              let password = passwordTxt.text else {
            return
        }

        loginViewModel.login(email: email, password: password) { success in
            if success {
                // Navigate to home screen or perform necessary action
                print("Login successful")
            } else {
                // Show error message or handle failed login
                print("Login failed")
            }
        }
    }

}
