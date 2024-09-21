//
//  UserProfileModal.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI

struct UserProfileModal: View {
    @Binding var showModal: Bool  // Binding to dismiss the modal
    @State private var profileImage: Image? = Image(systemName: "person.crop.circle.fill")  // Default profile image

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Close Button
                HStack {
                    Spacer()
                    Button(action: {
                        showModal = false  // Dismiss modal
                    }) {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.primary)
                    }
                    .padding()
                }
                
                // Profile Image with Camera Icon
                ZStack {
                    profileImage?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    Button(action: {
                        // Future functionality for image picker can go here
                    }) {
                        Image(systemName: "camera.fill")
                            .frame(width: 25, height: 25)
                            .padding(6)
                            .background(Color(.systemBlue))
                            .clipShape(Circle())
                            .offset(x: 40, y: 40)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 10)
                
                // Username
                Text("Pravin Jayasinghe")
                    .font(.title2)
                    .fontWeight(.bold)
                
                // Log off Button
                Button(action: {
                    // Log off action
                }) {
                    Text("Log off")
                        .font(.headline)
                        .padding()
                        .frame(width: 150)
                        .background(Color(.systemGray5))
                        .foregroundColor(.primary)
                        .cornerRadius(15)
                }
                .padding(.bottom, 20)
                
                // Section 1: Personal Details and Bank Details
                HStack(spacing: 20) {
                    Button(action: {
                        // Action for Personal Details
                    }) {
                        VStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Personal Details")
                                .font(.footnote)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    Button(action: {
                        // Action for Bank Details
                    }) {
                        VStack {
                            Image(systemName: "australiandollarsign.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Bank Details")
                                .font(.footnote)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                
                // Section 2: Notifications
                VStack(alignment: .leading) {
                    Text("Notifications")
                        .font(.headline)
                    Text("View your notifications")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                
                // Section 3: SwiftUI List for Settings
                VStack(alignment: .leading, spacing: 15) {
                    settingsRow(iconName: "shield.fill", text: "Accounts & Security", destination: SettingsDetailView(title: "Accounts & Security"))
                    settingsRow(iconName: "bell.fill", text: "Notification Preferences", destination: SettingsDetailView(title: "Notification Preferences"))
                    settingsRow(iconName: "lock.fill", text: "Password, PIN, and FaceID", destination: SettingsDetailView(title: "Password, PIN, and FaceID"))
                    settingsRow(iconName: "creditcard.fill", text: "Card Limits", destination: SettingsDetailView(title: "Card Limits"))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)  // Space for scrolling
        }
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.top)
    }
    
    // Helper function to create rows in the settings list
    func settingsRow<Destination: View>(iconName: String, text: String, destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: 20, height: 20)  // Smaller icon size for a cleaner look
                    .foregroundColor(.primary)
                Text(text)
                    .font(.system(size: 16, weight: .medium))  // Adjusted text size and weight
                    .padding(.leading, 10)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)  // Chevron for navigation indicator
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color(.secondarySystemBackground))  // Background for each row
            .cornerRadius(8)
        }
    }
}
