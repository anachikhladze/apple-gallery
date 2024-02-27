//
//  RegistrationView.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import SwiftUI

struct RegistrationView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                signUpImage
                signUpText
            }
            inputFields
            signUpButton
            Spacer()
            signInButton
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Success"),
                message: Text("You've registered successfully, you can sign in from the login page"),
                dismissButton: .default(Text("OK"))
                {
                    dismiss()
                }
            )
        }
    }
    
    // MARK: - View Components
    private var signUpImage: some View {
        Image("registration")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 90, maxHeight: 100)
            .padding(.top, 30)
    }
    
    private var signUpText: some View {
        Text("Sign Up")
            .font(.custom("Avenir Next", size: 26))
            .fontWeight(.semibold)
    }
    
    private var inputFields: some View {
        VStack(spacing: 6) {
            InputView(text: $viewModel.email,
                      title: "Email Address",
                      placeholder: "name@gmail.com", errorMessage: viewModel.emailPrompt)
            .textInputAutocapitalization(.never)
            .onChange(of: viewModel.email) { _, _ in
                viewModel.didStartTypingEmail = true
            }
            
            InputView(text: $viewModel.age,
                      title: "Age",
                      placeholder: "Enter your age", errorMessage: viewModel.agePrompt)
            .onChange(of: viewModel.age) { _, _ in
                viewModel.didStartTypingAge = true
            }
            
            InputView(text: $viewModel.password,
                      title: "Password",
                      placeholder: "Enter your password",
                      isSecureField: true, errorMessage: viewModel.passwordPrompt)
            .onChange(of: viewModel.password) { _, _ in
                viewModel.didStartTypingPassword = true
            }
            confirmPasswordField
        }
        .padding(.horizontal)
        .padding(.top, 2)
    }
    
    private var confirmPasswordField: some View {
        ZStack(alignment: .trailing) {
            InputView(text: $viewModel.confirmPassword,
                      title: "Confirm Password",
                      placeholder: "Confirm your password",
                      isSecureField: true, errorMessage: viewModel.confirmPasswordPrompt)
            .onChange(of: viewModel.confirmPassword) { _, _ in
                viewModel.didStartTypingConfirmPassword = true
            }
            
            if !viewModel.password.isEmpty && !viewModel.confirmPassword.isEmpty {
                if viewModel.password == viewModel.confirmPassword {
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.blue))
                        .padding(.horizontal)
                } else {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemRed))
                        .padding(.horizontal)
                }
            }
        }
    }
    
    private var signUpButton: some View {
        CustomSignInButton(label: "SIGN UP") {
            Task {
                do {
                    try await MockAPI.shared.register(email: viewModel.email, password: viewModel.password, age: viewModel.age)
                    viewModel.showAlert = true
                } catch {
                    print("An error occurred: \(error)")
                }
            }
        }
        .disabled(!viewModel.isRegistrationFormValid)
        .opacity(viewModel.isRegistrationFormValid ? 1.0 : 0.5)
    }
    
    private var signInButton: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 2) {
                Text("Have an account?")
                Text("Sign In")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
        }
    }
}

// MARK: - Preview
#Preview {
    RegistrationView(viewModel: RegistrationViewModel())
}
