//
//  LoginView.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import SwiftUI
import NetworkManager

struct LoginView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: LoginViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            loginImage
            mainVStack
            signInButton
            Spacer()
            registrationLink
        }
        .navigate(when: $viewModel.isLoggedIn, to: AppleGalleryView(viewModel: AppleGalleryViewModel(networkManager: NetworkManager())))
    }
    
    // MARK: - View Components
    private var loginImage: some View {
        Image("login")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 90, maxHeight: 100)
            .padding(.top, 30)
    }
    
    private var mainVStack: some View {
        VStack(spacing: 24) {
            Text("Login")
                .font(.custom("Avenir Next", size: 30))
                .fontWeight(.semibold)
            
            InputView(text: $viewModel.email,
                      title: "Email Address",
                      placeholder: "name@gmail.com", errorMessage: viewModel.emailPrompt)
            .textInputAutocapitalization(.never)
            .onChange(of: viewModel.email) { _, _ in
                viewModel.didStartTypingEmail = true
            }
            
            InputView(text: $viewModel.password,
                      title: "Password",
                      placeholder: "Enter your password",
                      isSecureField: true, errorMessage: viewModel.passwordPrompt)
            .onChange(of: viewModel.password) { _, _ in
                viewModel.didStartTypingPassword = true
            }
            
            forgotPasswordLink
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
    
    private var forgotPasswordLink: some View {
        HStack(alignment: .bottom) {
            Spacer()
            Text("Forgot Password?")
                .fontWeight(.bold)
                .font(.footnote)
                .foregroundStyle(Color.accentColor)
        }
    }
    
    private var signInButton: some View {
        NavigationView {
            CustomSignInButton(label: "SIGN IN") {
                Task {
                    do {
                        try await MockAPI.shared.login(email: viewModel.email, password: viewModel.password)
                        viewModel.isLoggedIn = true
                        
                    } catch {
                        viewModel.showingAlert = true
                    }
                }
            }
            .disabled(!viewModel.isLoginFormValid)
            .opacity(viewModel.isLoginFormValid ? 1.0 : 0.5)
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text("Login Error"), message: Text("The email address or password you entered is incorrect. Please try again."), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private var registrationLink: some View {
        NavigationLink(destination: RegistrationView(viewModel: RegistrationViewModel())) {
            HStack(spacing: 2) {
                Text("Don't have an account? ")
                Text("Sign Up")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
        }
    }
}


// MARK: - Preview
#Preview {
    LoginView(viewModel: LoginViewModel())
}
