//
//  HackerLoginView.swift
//  MatrixRain
//
//  Created by SaiJyotsna on 08/12/25.
//

import Foundation
import SwiftUI

import SwiftUI

// MARK: - Hacker Login View
/// A terminal-style login screen inspired by classic “hacker” UIs.
/// Focuses on atmosphere: matrix rain, glowing green text, and minimal controls.

struct HackerLoginView: View {

    // User input
    @State private var username = ""
    @State private var password = ""
    // Controls the blinking cursor animation in the header
    @State private var showCursor = true

    var body: some View {
        ZStack {
            // Animated Matrix-style background
            MatrixRainView()
                .ignoresSafeArea()
            // Dark overlay to improve contrast and readability
            Color.black.opacity(0.35)
                .ignoresSafeArea()
            VStack(spacing: 32) {

                // MARK: - Header / Terminal Title
                HStack(spacing: 0) {
                    Text("ACCESS TERMINAL")
                        .font(.system(size: 24, weight: .semibold, design: .monospaced))
                        .foregroundColor(.green)
                        // Layered glow to give a neon terminal feel
                        .shadow(color: Color.green.opacity(0.9), radius: 8)
                        .shadow(color: Color.green.opacity(0.6), radius: 12)
                    // Blinking cursor effect
                    Text(showCursor ? "_" : "")
                        .font(.system(size: 24, weight: .bold, design: .monospaced))
                        .foregroundColor(.green)
                        .offset(y: -2)
                        .animation(
                            .easeInOut(duration: 0.6).repeatForever(),
                            value: showCursor
                        )
                }
                .onAppear {
                    // Start cursor blink loop
                    withAnimation {
                        showCursor.toggle()
                    }
                }
                VStack(spacing: 18) {
                    // Username / Ident Code
                    VStack(alignment: .leading, spacing: 4) {
                        Text("IDENT CODE")
                            .font(.caption)
                            .foregroundColor(Color.green.opacity(0.7))

                        TextField("", text: $username)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 12)
                            .background(Color.black.opacity(0.25))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.green.opacity(0.7), lineWidth: 1)
                            )
                            .foregroundColor(.white)
                            .tint(.green)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                    }

                    // Password / Passkey
                    VStack(alignment: .leading, spacing: 4) {
                        Text("PASSKEY")
                            .font(.caption)
                            .foregroundColor(Color.green.opacity(0.7))

                        SecureField("", text: $password)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 12)
                            .background(Color.black.opacity(0.25))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.green.opacity(0.7), lineWidth: 1)
                            )
                            .foregroundColor(.white)
                            .tint(.green)
                    }
                }
                Button(action: {
                    // Handle authentication trigger here
                }) {
                    Text("INITIATE LOGIN")
                        .font(.system(size: 16, weight: .semibold, design: .monospaced))
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(6)
                        // Glow to keep visual hierarchy strong
                        .shadow(color: Color.green.opacity(0.5), radius: 10)
                        .shadow(color: Color.green.opacity(0.5), radius: 16)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 32)
            // Keeps content vertically centered on all screen sizes
            .frame(maxHeight: .infinity, alignment: .center)
        }
    }
}

