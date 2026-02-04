//
//  MatrixColumnView.swift
//  MatrixRain
//
//  Created by SaiJyotsna on 07/12/25.
//

import SwiftUI

import SwiftUI

// MARK: - Matrix Rain Column
/// Represents a single vertical stream of falling characters.
///  Each column manages its own characters, speed, and reset cycle.

struct MatrixRainColumn: View {
    @ObservedObject var displayLink: DisplayLink
    @State private var chars: [FallingChar] = []
    @State private var speed: CGFloat = .random(in: 1.2...3.5)
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        ZStack {
            // Render each character in the stream
            ForEach(chars) { char in
                Text(char.value)
                    .font(.system(size: 18, weight: .light, design: .monospaced))
                    .foregroundColor(Color.green.opacity(char.opacity))
                    // Subtle glow to sell the Matrix aesthetic
                    .shadow(
                        color: Color.green.opacity(char.opacity * 0.7),
                        radius: 4
                    )
                    .position(x: 0, y: char.y)
            }
        }
        .frame(width: 20)
        .onAppear {
            setupStream()
        }
        .onChange(of: displayLink.timestamp) { _ in
            updateStream()
        }
    }

    // MARK: - Stream Setup
    /// Creates a new group of characters starting above the screen.
    /// Called on first load and whenever a stream finishes falling.

    func setupStream() {
        let segmentSize = Int.random(in: 3...6)

        chars = (0..<segmentSize).map { i in
            FallingChar(
                value: randomChar(),
                y: CGFloat(-i * 22),
                // Fade tail effect: top is brightest
                opacity: 0.2 + Double(i) * 0.18
            )
        }
    }

    func updateStream() {
        for i in chars.indices {
            // Move character down based on column speed
            chars[i].y += speed
            if i == 0 {
                chars[i].opacity = 0.70
            } else {
                chars[i].opacity = Double.random(in: 0.15...0.40)
            }
            // If the stream passes the bottom, restart it
            if chars[i].y > screenHeight + 50 {
                setupStream()
                return
            }
        }
    }

    // Returns a random alphanumeric character for the Matrix look.
    func randomChar() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz0123456789"
        return String(letters.randomElement()!)
    }
}

// MARK: - Display Link Driver
/// A lightweight wrapper around CADisplayLink.
/// Publishes a timestamp every frame to drive SwiftUI updates.

class DisplayLink: ObservableObject {

    // Changes every frame, triggering SwiftUI view updates
    @Published var timestamp: CFTimeInterval = 0

    private var link: CADisplayLink?

    init() {
        link = CADisplayLink(target: self, selector: #selector(update))
        link?.add(to: .main, forMode: .common)
    }

    @objc private func update(link: CADisplayLink) {
        timestamp = link.timestamp
    }

    deinit {
        // Always clean up display links
        link?.invalidate()
    }
}

// MARK: - Preview
struct MatrixRainView_Previews: PreviewProvider {
    static var previews: some View {
        HackerLoginView()
    }
}


