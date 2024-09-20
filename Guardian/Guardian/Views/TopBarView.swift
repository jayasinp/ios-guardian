//
//  TopBarView.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI

struct TopBarView: View {
    @State private var showUserProfileModal = false // Track if the profile modal is open
    @State private var showAppHelpModal = false // Track if the help modal is open
    
    var body: some View {
        HStack {
            // Left: User Profile icon
            Button(action: {
                showUserProfileModal = true
            }) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.primary)
            }
            .sheet(isPresented: $showUserProfileModal) {
                UserProfileModal(showModal: $showUserProfileModal)
            }
            
            Spacer()
            
            // Right: App Help icon
            Button(action: {
                showAppHelpModal = true
            }) {
                Image(systemName: "questionmark.bubble.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.primary)
            }
            .sheet(isPresented: $showAppHelpModal) {
                AppHelpModal(showModal: $showAppHelpModal)
            }
        }
        .padding(.horizontal)
    }
}
