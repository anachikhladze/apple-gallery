//
//  LoginViewModel.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var isLoggedIn = false
    @Published var email = ""
    @Published var password = ""
    @Published var showingAlert = false
    @Published var alertMessage = ""
    
    var didStartTypingEmail = false
    var didStartTypingPassword = false
    
    
    // MARK: - Computed Properties
    var emailPrompt: String {
        if isEmailValid() || !didStartTypingEmail {
            return ""
        } else {
            return "Enter a valid email address"
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() || !didStartTypingPassword {
            return ""
        } else  {
            return "Password must contain 6-12 characters"
        }
    }
    
    var isLoginFormValid: Bool {
        if !isEmailValid() ||
            !isPasswordValid() {
            return false
        }
        return true
    }
    
    // MARK: - LoginViewModel Methods
    func isEmailValid() -> Bool {
        !email.isEmpty && email.contains("@")
    }
    
    func isPasswordValid() -> Bool {
        !password.isEmpty && password.count >= 6 && password.count <= 12
    }
}
