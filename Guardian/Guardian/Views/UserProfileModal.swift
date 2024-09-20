//
//  UserProfileModal.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI

struct UserProfileModal: View {
    @Binding var showModal: Bool  // Binding to dismiss the modal

    var body: some View {
        VStack {
            // Close Button
            HStack {
                Spacer()
                Button(action: {
                    showModal = false  // Dismiss modal
                }) {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.primary)
                }
                .padding()
            }
            
            Spacer()
            
            Text("User Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Add more profile content here
            
            Spacer()
        }
        .padding()
    }
}
