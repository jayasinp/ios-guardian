//
//  SettingsDetailView.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//
import SwiftUI

struct SettingsDetailView: View {
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)  // Back button is handled automatically by SwiftUI
    }
}
