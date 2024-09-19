//
//  LoginView.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool //binding to modify login state
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var showForgotPasswordModal: Bool = false // State to show password reset modal
    
    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Hey, Welcome Back!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .multilineTextAlignment(.center)
            
            // Email Field with Icon
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.gray)
                TextField("Enter your email", text: $email)
                    .keyboardType(.emailAddress)
                    
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            // Password Field with Eye Icon
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(.gray)
                if showPassword {
                    TextField("Enter your password", text: $password)
                } else {
                    SecureField("Enter your password", text: $password)
                }
                
                Button(action: {
                    showPassword.toggle()
                }) {
                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            // Forgot Password Link
            HStack {
                Spacer()
                Button(action: {
                    showForgotPasswordModal = true //show the modal
                }) {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $showForgotPasswordModal) {
                    ForgotPasswordView() //show the forgot password modal
                }
            }
            .padding(.horizontal)
            
            // Login Button
            Button(action: {
                isLoggedIn = true
                // Login action
            }) {
                Text("Login")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            // Or continue with
            Text("or continue with")
                .font(.footnote)
                .foregroundColor(.gray)
            
            // Google and Apple Login Buttons
            HStack(spacing: 20) {
                Button(action: {
                    // Google login action
                }) {
                    HStack {
                        Image(systemName: "globe")
                        Text("Google")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                
                Button(action: {
                    // Apple login action
                }) {
                    HStack {
                        Image(systemName: "applelogo")
                        Text("Apple")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Sign up link
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                
                NavigationLink(destination: SignupView(isLoggedIn: $isLoggedIn)) {
                    Text("Sign up")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom)
        }
        .padding()
    }
}
