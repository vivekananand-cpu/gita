//
//  SignUpViewController.swift
//  Gita
//
//  Created by Vivek Thorat on 25/03/24.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var buttonSignup: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textFieldPassword: UnderLineTextField!
    @IBOutlet weak var textFieldConfirmPassword: UnderLineTextField!
    @IBOutlet weak var textFieldEmail: UnderLineTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func buttonHandlerSignup(_ sender: UIButton) {
        let email = textFieldEmail.text
        let password = textFieldPassword.text
        let cPassword = textFieldConfirmPassword.text
        
        if let email, !email.isEmpty, let password, !password.isEmpty, let cPassword, !cPassword.isEmpty {
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
            self.showAlert(message: "Please fill all the fields.")
        }
    }
    
    
    func navigateToHomeViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "TabNavigationController")
        
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
   

}
