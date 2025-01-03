//
//  HomeView.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            TopBarView() // Stays static at all times at the top of all tabs
            
            TabView { // Switches between views
                DashboardView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Dashboard")
                    }
                
                CardsView()
                    .tabItem {
                        Image(systemName: "creditcard.fill")
                        Text("Cards")
                    }
                
                TransactionsView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Transactions")
                    }
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
        }
        .background(Color(.systemBackground))
    }
}
