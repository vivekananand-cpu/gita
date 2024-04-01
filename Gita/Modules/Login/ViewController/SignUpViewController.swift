//
//  SignUpViewController.swift
//  Gita
//
//  Created by Vivek Thorat on 25/03/24.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var buttonSignup: LoginButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textFieldPassword: UnderLineTextField!
    @IBOutlet weak var textFieldConfirmPassword: UnderLineTextField!
    @IBOutlet weak var textFieldEmail: UnderLineTextField!
    
    var viewModel: AuthViewModel = AuthViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        textFieldPassword.isSecureTextEntry = true
        textFieldConfirmPassword.isSecureTextEntry = true
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
        textFieldConfirmPassword.delegate = self
        buttonSignup.isEnabled = false
    }
    
    @IBAction func buttonHandlerSignup(_ sender: UIButton) {
        self.view.endEditing(true)
        let email = textFieldEmail.text
        let password = textFieldPassword.text
        let cPassword = textFieldConfirmPassword.text
        
        if let email, !email.isEmpty, let password, !password.isEmpty, let cPassword, !cPassword.isEmpty {
            if self.viewModel.isValidEmail(email) {
                if password == cPassword {
                    buttonSignup.isHidden = true
                    startIndicator(indicator: activityIndicator)
                    Auth.auth().createUser(withEmail: email, password: password) { result, error in
                        self.stopIndicator(indicator: self.activityIndicator)
                        if let error {
                            self.showAlert(message: error.localizedDescription)
                        } else {
                            self.navigateToHomeViewController()
                        }
                    }
                }
            } else {
                self.showAlert(message: "Please enter valid email.")
            }
        } else {
            self.showAlert(message: "Please fill all the fields.")
            self.textFieldEmail.showError()
            self.textFieldPassword.showError()
            self.textFieldConfirmPassword.showError()
        }
    }
    
    
    func navigateToHomeViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "TabNavigationController")
        
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    @IBAction func buttonHandlerLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textFieldPassword {
            guard let password = self.textFieldPassword.text else {return true}
            if self.viewModel.isValidPassword(password) {
                self.textFieldPassword.removeError()
            } else {
                self.textFieldPassword.showError()
            }
            self.viewModel.password = password
        } else if textField == textFieldConfirmPassword {
            guard let cPassword = self.textFieldConfirmPassword.text else {return true}
            if self.viewModel.isConfirmPasswordAndPasswordSame(cPassword: cPassword) {
                self.textFieldConfirmPassword.removeError()
                if let email = self.textFieldEmail.text, !email.isEmpty {
                    self.buttonSignup.isEnabled = true
                }
            } else {
                self.textFieldConfirmPassword.showError()
            }
        } else if textField == textFieldEmail {
            guard let email = self.textFieldEmail.text else {return true}
            if self.viewModel.isValidEmail(email) {
                self.textFieldEmail.removeError()
            } else {
                self.textFieldEmail.showError()
            }
        }
        
        return true
    }
}
