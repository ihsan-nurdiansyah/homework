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
    @IBOutlet weak var loginBtn: AppButtonPrimary!
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var emailErrorView: UIView!
    @IBOutlet weak var emailErrorLbl: UILabel!
    @IBOutlet weak var passwordErrorView: UIView!
    @IBOutlet weak var passwordErrorLbl: UILabel!
    
    let loginViewModel = LoginViewModel()
    let emailRegEx = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        emailTxt.delegate = self
        emailTxt.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        emailTxt.keyboardType = .emailAddress
        passwordTxt.delegate = self
        passwordTxt.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        
        let closeTap = UITapGestureRecognizer(target: self, action: #selector(dismissScreen))
        closeView.isUserInteractionEnabled = true
        closeView.addGestureRecognizer(closeTap)
        
        emailErrorView.isHidden = true
        passwordErrorView.isHidden = true
        loginBtn.isUserInteractionEnabled = false
    }
    
    @objc func dismissScreen() {
        self.dismiss(animated: true)
    }
    
    func isValidEmail() -> Bool {
        let emailPred = NSPredicate(
            format: "SELF MATCHES %@", emailRegEx
        )
        return emailPred.evaluate(with: emailTxt.text)
    }
    
    func isValidPassword() -> Bool {
        return !(passwordTxt.text == "")
    }
    
    func checkButtonStatus() {
        loginBtn.isUserInteractionEnabled = isValidEmail() && isValidPassword()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTxt.text,
              let password = passwordTxt.text else {
            return
        }

        loginViewModel.login(email: email, password: password) { response in
            switch response {
            case .success(let apiResponse):
                saveObject(apiResponse.data.user)
                self.dismissScreen()
            case .failure(_):
                self.showAlert(title: "Login Failed", message: "Your email or password is incorrect.")
            }
        }
    }
}

extension LoginVC: LoginViewModelDelegate {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate {
    
    // MARK: - UITextField Delegate
    @objc func textFieldDidChanged(_ textField: UITextField) {
        let errMsg = "can't be blank"
        switch textField {
        case emailTxt:
            if emailTxt.text == "" {
                emailErrorLbl.text = "Email \(errMsg)"
            } else {
                let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
                if !emailPred.evaluate(with: emailTxt.text) {
                    emailErrorLbl.text = "Wrong format email"
                }
            }
            emailErrorView.isHidden = isValidEmail()
            
        case passwordTxt:
            passwordErrorLbl.text = "Password \(errMsg)"
            passwordErrorView.isHidden = isValidPassword()
        default:
            break
        }
        
        checkButtonStatus()
    }
}
