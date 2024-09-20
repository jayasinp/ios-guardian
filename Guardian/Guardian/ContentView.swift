//
//  ContentView.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = true  // This state will determine if user is logged in
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                HomeView()  // Show the main app if logged in
            } else {
                OnboardingView(isLoggedIn: $isLoggedIn)  // Show onboarding if not logged in
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
