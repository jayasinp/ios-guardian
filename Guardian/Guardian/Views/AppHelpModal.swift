//
//  AppHelpModal.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI

struct AppHelpModal: View {
    @Binding var showModal: Bool  // Binding to dismiss the modal

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
                
                // Section 1: Message Us
                VStack(alignment: .leading, spacing: 10) {
                    Text("Message us")
                        .font(.headline)
                    Text("Get help from our virtual assistant, or connect with a specialist")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                
                // Section 2: FAQ
                VStack(alignment: .leading, spacing: 15) {
                    Text("FAQ")
                        .font(.headline)
                        .padding(.leading, 15)
                    
                    settingsRow(iconName: "person.fill", text: "Profile and Settings", destination: FAQDetailView(title: "Profile and Settings"))
                    settingsRow(iconName: "banknote.fill", text: "Accounts", destination: FAQDetailView(title: "Accounts"))
                    settingsRow(iconName: "creditcard.fill", text: "Cards", destination: FAQDetailView(title: "Cards"))
                    settingsRow(iconName: "exclamationmark.shield.fill", text: "Financial Abuse", destination: FAQDetailView(title: "Financial Abuse"))
                    settingsRow(iconName: "list.bullet", text: "View all topics", destination: FAQDetailView(title: "All Topics"))
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                
                // Section 3: Additional Links
                VStack(alignment: .leading, spacing: 15) {
                    settingsRow(iconName: "figure.walk.circle.fill", text: "Accessibility Services", destination: FAQDetailView(title: "Accessibility Services"))
                    settingsRow(iconName: "pencil.and.outline", text: "Send Feedback", destination: FAQDetailView(title: "Send Feedback"))
                    settingsRow(iconName: "exclamationmark.bubble.fill", text: "Complaints", destination: FAQDetailView(title: "Complaints"))
                    settingsRow(iconName: "doc.text.fill", text: "Terms and Conditions", destination: FAQDetailView(title: "Terms and Conditions"))
                }
                .padding()
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
                    .frame(width: 20, height: 20)  // Adjust icon size
                    .foregroundColor(.primary)
                Text(text)
                    .font(.system(size: 16, weight: .medium))
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

struct FAQDetailView: View {
    let title: String

    var body: some View {
        Text("Details about \(title)")
            .font(.largeTitle)
            .navigationBarTitleDisplayMode(.inline)
    }
}
