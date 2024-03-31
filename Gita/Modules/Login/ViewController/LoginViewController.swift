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
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var textFieldEmail: UnderLineTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.buttonLogin.isHidden = false
        
    }
    
    @IBAction func buttonHandlerLogin(_ sender: Any) {
        let email = textFieldEmail.text
        let password = textFieldPassword.text
        
        if let email, !email.isEmpty, let password, !password.isEmpty {
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
            self.showAlert(message: "Please fill all the fields.")
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
