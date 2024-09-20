//
//  SignupView.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI

struct SignupView: View {
    @Binding var isLoggedIn: Bool  // Binding to modify login state
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Let's get started")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .foregroundColor(Color.primary)
            
            // First Name Field
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.gray)
                TextField("First Name", text: $firstName)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            // Last Name Field
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.secondary)
                TextField("Last Name", text: $lastName)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            // Phone Field
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.secondary)
                TextField("Phone Number", text: $phone)
                    .keyboardType(.phonePad)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            // Email Field
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.secondary)
                TextField("Email", text: $email)
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
                    TextField("Password", text: $password)
                } else {
                    SecureField("Password", text: $password)
                }
                
                Button(action: {
                    showPassword.toggle()
                }) {
                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            // Sign Up Button
            Button(action: {
                // Simulate successful signup
                isLoggedIn = true  // Update login state
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            // Or signup with
            Text("or sign up with")
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
                Text("Already have an account?")
                    .foregroundColor(.gray)
                
                NavigationLink(destination: LoginView(isLoggedIn: $isLoggedIn)) {
                    Text("Log in")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
    }
}
