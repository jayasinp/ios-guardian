//
//  OnboardingView.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isLoggedIn: Bool  // Binding to track login state from ContentView

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Spacer()
                
                // Title and Subtitle
                VStack {
                    Text("Welcome to Guardian")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text("You are one step closer to peace of mind!")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                }
                
                Spacer()
                
                // Navigation buttons
                VStack(spacing: 20) {
                    NavigationLink(destination: LoginView(isLoggedIn: $isLoggedIn)) {  // Pass isLoggedIn to LoginView
                        Text("Login")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .padding(.horizontal, 20)
                    }
                    
                    NavigationLink(destination: SignupView(isLoggedIn: $isLoggedIn)) {  // Pass isLoggedIn to SignupView
                        Text("Sign Up")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.black)
                            .cornerRadius(30)
                            .padding(.horizontal, 20)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
