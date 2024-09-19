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
            
            // First Name Field
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.gray)
                TextField("First Name", text: $firstName)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(25)
            
            // Last Name Field
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.gray)
                TextField("Last Name", text: $lastName)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(25)
            
            // Phone Field
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.gray)
                TextField("Phone Number", text: $phone)
                    .keyboardType(.phonePad)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(25)
            
            // Email Field
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.gray)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(25)
            
            // Password Field with Eye Icon
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(.gray)
                if showPassword {
                    TextField("Password", text: $password)
                } else {
                    SecureField("Password", text: $password)
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
            .cornerRadius(25)
            
            // Sign Up Button
            Button(action: {
                // Simulate successful signup
                isLoggedIn = true  // Update login state
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    .padding(.horizontal)
            }
            // Or signup with
            Text("or sign up with")
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
                    .cornerRadius(25)
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
                    .cornerRadius(25)
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
    }
}
