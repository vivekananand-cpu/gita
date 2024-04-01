//
//  LoginViewController.swift
//  Gita
//
//  Created by Vivek Thorat on 25/03/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var textFieldPassword: UnderLineTextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var buttonLogin: LoginButton!
    @IBOutlet weak var textFieldEmail: UnderLineTextField!
    
    var viewModel: AuthViewModel = AuthViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.buttonLogin.isHidden = false
        
    }
    
    func setupView() {
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.delegate = self
        textFieldEmail.delegate = self
        buttonLogin.isEnabled = false
    }
    
    @IBAction func buttonHandlerLogin(_ sender: Any) {
        self.view.endEditing(true)
        let email = textFieldEmail.text
        let password = textFieldPassword.text
        
        if let email, !email.isEmpty, let password, !password.isEmpty {
            if self.viewModel.isValidEmail(email) {
                self.buttonLogin.isHidden = true
                self.startIndicator(indicator: activityIndicator)
                Auth.auth().signIn(withEmail: email, password: password) {[weak self]
                    result, error in
                    guard let strongSelf = self else {return}
                    strongSelf.stopIndicator(indicator: strongSelf.activityIndicator)
                    if let error {
                        self?.buttonLogin.isHidden = false
                        strongSelf.showAlert(message: error.localizedDescription)
                    } else {
                        strongSelf.navigateToHomeViewController()
                    }
                }
            } else {
                self.showAlert(message: "Please enter valid email.")
            }
        } else {
            self.showAlert(message: "Please fill all the fields.")
            self.textFieldEmail.showError()
            self.textFieldPassword.showError()
        }
    }
    
    func navigateToHomeViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "TabNavigationController")
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
    }
    
    @IBAction func buttonHandlerSignup(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}


extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textFieldPassword {
            guard let password = self.textFieldPassword.text else {return true}
            if self.viewModel.isValidPassword(password) {
                self.textFieldPassword.removeError()
                if let email = self.textFieldEmail.text, !email.isEmpty {
                    self.buttonLogin.isEnabled = true
                }
            } else {
                self.textFieldPassword.showError()
                self.buttonLogin.isEnabled = false
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
