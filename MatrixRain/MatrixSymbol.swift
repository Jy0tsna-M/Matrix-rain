//
//  MatrixSymbol.swift
//  MatrixRain
//
//  Created by SaiJyotsna on 07/12/25.
//

import Foundation
import SwiftUI

struct FallingChar: Identifiable {
    let id = UUID()
    var value: String
    var y: CGFloat
    var opacity: Double
}

struct MatrixRainView: View {

    @StateObject private var displayLink = DisplayLink()

    let columns = Int(UIScreen.main.bounds.width / 80) + 6

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<columns, id: \.self) { _ in
                MatrixRainColumn(displayLink: displayLink)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .black))
        .ignoresSafeArea()
    }
}

