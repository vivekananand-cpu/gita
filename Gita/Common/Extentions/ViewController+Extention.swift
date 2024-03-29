//
//  ViewController+Extention.swift
//  Gita
//
//  Created by Vivek Thorat on 25/03/24.
//

import UIKit

extension UIViewController {
    func startIndicator(indicator: UIActivityIndicatorView) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    func stopIndicator(indicator: UIActivityIndicatorView) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    
    func showAlert(message: String = "") {
        let alertController  = UIAlertController(title: "Gita", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.dismiss(animated: true)
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
