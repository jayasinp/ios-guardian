//
//  ForgotPasswordView.swift.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var showConfirmation: Bool = false  // For showing confirmation message
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Reset Password")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
                .padding(.bottom, 20)
            
            Text("Please enter your email address to receive a password reset link.")
                .font(.body)
                .foregroundColor(Color.secondary)
                .multilineTextAlignment(.center)
            
            // Email Input
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(Color.secondary)
                TextField("Enter your email", text: $email)
                    .keyboardType(.emailAddress)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            // Send Reset Link Button
            Button(action: {
                // Simulate sending reset link
                showConfirmation = true  // Show confirmation message
                
                // Automatically dismiss the modal after a short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    presentationMode.wrappedValue.dismiss()  // Dismiss after 2 seconds
                }
            }) {
                Text("Send Reset Link")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            if showConfirmation {
                Text("A password reset link has been sent to your email.")
                    .font(.footnote)
                    .foregroundColor(.green)
                    .padding(.top, 10)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
    }
}
