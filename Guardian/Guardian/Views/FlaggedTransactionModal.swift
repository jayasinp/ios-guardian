//
//  FlaggedTransactionModal.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI

struct FlaggedTransactionModal: View {
    @Binding var showModal: Bool  // Binding to dismiss the modal

    var body: some View {
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
            
            Text("Flagged Transaction Details")
                .font(.largeTitle)
                .padding()
            
            Text("This transaction looks suspicious: $500 spent at XYZ store.")
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemBackground))
    }
}
