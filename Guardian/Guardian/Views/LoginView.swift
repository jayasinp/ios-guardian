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
                .foregroundColor(Color.primary)
            
            // Email Field with Icon
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.secondary)
                TextField("Enter your email", text: $email)
                    .keyboardType(.emailAddress)
                    
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            // Password Field with Eye Icon
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
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
                        .foregroundColor(.accentColor)
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
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            // Or continue with
            Text("or continue with")
                .font(.footnote)
                .foregroundColor(.secondary)
            
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
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                
                Button(action: {
                    // Apple login action
                }) {
                    HStack {
                        Image(systemName: "applelogo")
                            .foregroundColor(Color.white)
                        Text("Apple")
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.black))
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Sign up link
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.secondary)
                
                NavigationLink(destination: SignupView(isLoggedIn: $isLoggedIn)) {
                    Text("Sign up")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom)
        }
        .padding()
        .background(Color(.systemBackground))
    }
}
