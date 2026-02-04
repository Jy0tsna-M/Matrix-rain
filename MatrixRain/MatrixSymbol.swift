//
//  MatrixSymbol.swift
//  MatrixRain
//
//  Created by SaiJyotsna on 07/12/25.
//

import Foundation
import SwiftUI

// MARK: - Falling Character Model
/// Represents a single glyph in a Matrix rain stream.
/// Each character controls its own vertical position and brightness.

struct FallingChar: Identifiable {
    let id = UUID()
    var value: String
    var y: CGFloat
    var opacity: Double
}

// MARK: - Matrix Rain View
/// Full-screen background composed of multiple MatrixRainColumn views.
/// Owns the DisplayLink so all columns stay perfectly in sync.

struct MatrixRainView: View {

    // Single display link shared across all columns.
    // This keeps animation timing consistent and avoids multiple CADisplayLinks.
    @StateObject private var displayLink = DisplayLink()

    let columns = Int(UIScreen.main.bounds.width / 80) + 6
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<columns, id: \.self) { _ in
                MatrixRainColumn(displayLink: displayLink)
            }
        }
        // Expand to full screen
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .black))
        .ignoresSafeArea()
    }
}
