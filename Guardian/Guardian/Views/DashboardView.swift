//
//  DashboardView.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI
import Charts  // Needed for the bar chart

struct DashboardView: View {
    @State private var showTransactionModal = false  // State to control flagged transaction modal
    @State private var showCharts = false  // State to navigate to charts view
    @State private var isLoggedIn = true  // For log off button to return to OnboardingView
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 1. Personalized Greeting
                Text("Hi Pravin")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                // 2. Today's Activity - Progress bars for spending and withdrawals
                VStack(alignment: .leading) {
                    Text("Today's Activity")
                        .font(.headline)
                        .padding(.bottom, 10)
                    
                    // Spending Progress Bar
                    Text("Spent Today: $25 of $100")
                        .font(.subheadline)
                    ProgressView(value: 25, total: 100)
                        .accentColor(.blue)
                    
                    // Withdrawal Progress Bar
                    Text("Withdrawn Today: $40 of $150")
                        .font(.subheadline)
                    ProgressView(value: 40, total: 150)
                        .accentColor(.green)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // 3. Weekly Spending and Withdrawals - Bar Chart with two bars per day and a legend
                VStack(alignment: .leading) {
                    Text("Weekly Activity")
                        .font(.headline)
                    
                    // Total Spent and Withdrawn Summaries
                    HStack {
                        Text("Total Spent: $370")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                        Spacer()
                        Text("Total Withdrawn: $360")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    .padding(.bottom, 10)
                    
                    Chart {
                        BarMark(x: .value("Day", "Monday"), y: .value("Spent", 50))
                            .foregroundStyle(.blue)
                        BarMark(x: .value("Day", "Monday"), y: .value("Withdrawn", 20))
                            .foregroundStyle(.green)
                        
                        BarMark(x: .value("Day", "Tuesday"), y: .value("Spent", 30))
                            .foregroundStyle(.blue)
                        BarMark(x: .value("Day", "Tuesday"), y: .value("Withdrawn", 50))
                            .foregroundStyle(.green)
                        
                        BarMark(x: .value("Day", "Wednesday"), y: .value("Spent", 60))
                            .foregroundStyle(.blue)
                        BarMark(x: .value("Day", "Wednesday"), y: .value("Withdrawn", 40))
                            .foregroundStyle(.green)
                        
                        BarMark(x: .value("Day", "Thursday"), y: .value("Spent", 40))
                            .foregroundStyle(.blue)
                        BarMark(x: .value("Day", "Thursday"), y: .value("Withdrawn", 60))
                            .foregroundStyle(.green)
                        
                        BarMark(x: .value("Day", "Friday"), y: .value("Spent", 80))
                            .foregroundStyle(.blue)
                        BarMark(x: .value("Day", "Friday"), y: .value("Withdrawn", 70))
                            .foregroundStyle(.green)
                        
                        BarMark(x: .value("Day", "Saturday"), y: .value("Spent", 90))
                            .foregroundStyle(.blue)
                        BarMark(x: .value("Day", "Saturday"), y: .value("Withdrawn", 30))
                            .foregroundStyle(.green)
                        
                        BarMark(x: .value("Day", "Sunday"), y: .value("Spent", 20))
                            .foregroundStyle(.blue)
                        BarMark(x: .value("Day", "Sunday"), y: .value("Withdrawn", 90))
                            .foregroundStyle(.green)
                    }
                    .frame(height: 200)
                    
                    // Legend
                    HStack {
                        HStack {
                            Circle().fill(Color.blue).frame(width: 10, height: 10)
                            Text("Spent")
                                .font(.caption)
                        }
                        HStack {
                            Circle().fill(Color.green).frame(width: 10, height: 10)
                            Text("Withdrawn")
                                .font(.caption)
                        }
                        Spacer()
                        Button(action: {
                            showCharts = true
                        }) {
                            Text("Go to charts")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // 4. Flagged Transactions - Full width with red heading and vertical spacing
                VStack(alignment: .leading, spacing: 15) {
                    Text("Flagged Transactions")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("You have 1 flagged transaction")
                        .font(.subheadline)
                    
                    // Tap to view flagged transaction
                    Button(action: {
                        showTransactionModal = true
                    }) {
                        Text("View Flagged Transaction")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .sheet(isPresented: $showTransactionModal) {
                        FlaggedTransactionModal(showModal: $showTransactionModal)  // Display flagged transaction modal
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 1)
                )
                .padding(.horizontal)
                
                // 5. Bottom Buttons: Customize Dashboard and Log Off in VStack, not full width
                VStack(spacing: 10) {
                    Button(action: {
                        // Customize dashboard action
                    }) {
                        Text("Customize")
                            .font(.headline)
                            .padding()
                            .frame(width: 200)
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        isLoggedIn = false  // Log off action
                    }) {
                        Text("Log off")
                            .font(.headline)
                            .padding()
                            .frame(width: 200)
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.top)
    }
}
