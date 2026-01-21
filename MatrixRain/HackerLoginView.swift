//
//  HackerLoginView.swift
//  MatrixRain
//
//  Created by SaiJyotsna on 08/12/25.
//

import Foundation
import SwiftUI

struct HackerLoginView: View {

    @State private var username = ""
    @State private var password = ""
    @State private var showCursor = true

    var body: some View {
        ZStack {
            MatrixRainView()
                .ignoresSafeArea()

            Color.black.opacity(0.35)
                .ignoresSafeArea()

            VStack(spacing: 32) {
                HStack(spacing: 0) {
                    Text("ACCESS TERMINAL")
                        .font(.system(size: 24, weight: .semibold, design: .monospaced))
                        .foregroundColor(.green)
                        .shadow(color: Color.green.opacity(0.9), radius: 8, x: 0, y: 0)
                        .shadow(color: Color.green.opacity(0.6), radius: 12, x: 0, y: 0)

                    Text(showCursor ? "_" : "")
                        .foregroundColor(Color.green)
                        .font(.system(size: 24, weight: .bold, design: .monospaced))
                        .offset(y: -2)
                        .animation(.easeInOut(duration: 0.6).repeatForever(), value: showCursor)
                }
                .onAppear {
                    withAnimation { showCursor.toggle() }
                }
                VStack(spacing: 18) {
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

                Button(action: {}) {
                    Button(action: {}) {
                        Text("INITIATE LOGIN")
                            .font(.system(size: 16, weight: .semibold, design: .monospaced))
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(6)
                            .shadow(color: Color.green.opacity(0.5), radius: 10, x: 0, y: 0)
                            .shadow(color: Color.green.opacity(0.5), radius: 16, x: 0, y: 0)
                    }

                }
                .padding(.top, 10)

            }
            .padding(.horizontal, 32)
            .frame(maxHeight: .infinity, alignment: .center) 
        }
    }
}
