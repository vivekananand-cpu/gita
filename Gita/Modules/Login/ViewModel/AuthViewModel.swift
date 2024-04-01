//
//  ViewModel.swift
//  Gita
//
//  Created by Vivek Thorat on 01/04/24.
//

import Foundation

class AuthViewModel {
    var password: String?
    
    func isValidEmail(_ email: String) -> Bool {
        // Regular expression for email validation
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // Define your criteria here
        let minLength = 8
        let maxLength = 20
        
        // Check length
        guard password.count >= minLength && password.count <= maxLength else {
            return false
        }
        
        // Check for at least one uppercase letter
        let uppercaseRegex = ".*[A-Z]+.*"
        guard NSPredicate(format: "SELF MATCHES %@", uppercaseRegex).evaluate(with: password) else {
            return false
        }
        
        // Check for at least one lowercase letter
        let lowercaseRegex = ".*[a-z]+.*"
        guard NSPredicate(format: "SELF MATCHES %@", lowercaseRegex).evaluate(with: password) else {
            return false
        }
        
        // Check for at least one digit
        let digitRegex = ".*[0-9]+.*"
        guard NSPredicate(format: "SELF MATCHES %@", digitRegex).evaluate(with: password) else {
            return false
        }
        
        // Optionally, you can check for special characters or disallow certain patterns
        
        // All criteria passed, password is valid
        return true
    }
    
    
    func isConfirmPasswordAndPasswordSame(cPassword: String) -> Bool {
        if self.password == cPassword {
            return true
        }
        return false
    }


}
