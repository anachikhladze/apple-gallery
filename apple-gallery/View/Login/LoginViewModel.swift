//
//  LoginViewModel.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    
    @Published var email = ""
    @Published var password = ""
    @Published var showingAlert = false
    @Published var alertMessage = ""
    
    @Published var didStartTypingEmail = false
    @Published var didStartTypingPassword = false
    
    func isPasswordValid() -> Bool {
        !password.isEmpty && password.count >= 6 && password.count <= 12
    }
    
    func isEmailValid() -> Bool {
        !email.isEmpty && email.contains("@")
    }
    
    var isLoginFormValid: Bool {
        if !isEmailValid() ||
             !isPasswordValid() {
            return false
        }
        return true
    }
    
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
}
