//
//  RegistrationViewModel.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import Foundation

final class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var age = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showAlert = false
    
    @Published var didStartTypingEmail = false
    @Published var didStartTypingAge = false
    @Published var didStartTypingPassword = false
    @Published var didStartTypingConfirmPassword = false
    
    func isPasswordValid() -> Bool {
        !password.isEmpty && password.count >= 6 && password.count <= 12
    }
    
    func isEmailValid() -> Bool {
        !email.isEmpty && email.contains("@")
    }
    
    func isAgeValid() -> Bool {
        if let age = Int(age) {
            return age >= 18 && age <= 99
        } else {
            return false
        }
    }
    
    func isPasswordConfirmed() -> Bool {
        !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword
    }
    
    var isRegistrationFormValid: Bool {
        if !isEmailValid() ||
            !isAgeValid() ||
            !isPasswordValid() ||
            !isPasswordConfirmed() {
            return false
        }
        return true
    }
    
    // MARK: - Validation Prompt Strings
    var confirmPasswordPrompt: String {
        if isPasswordConfirmed() || !didStartTypingConfirmPassword {
            return ""
        } else {
            return "Password fields do not match"
        }
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
    
    var agePrompt: String {
        if isAgeValid() || !didStartTypingAge {
            return ""
        } else {
            return "Age must be between 18-99"
        }
    }
}
