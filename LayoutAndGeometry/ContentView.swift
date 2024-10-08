//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Mehmet Alp Sönmez on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: min(proxy.frame(in: .global).minY / fullView.frame(in: .global).maxY, 1), saturation: 1, brightness: 1))
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(proxy.frame(in: .global).minY < 200 ? 0.1 : 1.0)
                            .scaleEffect(max(0.5, min(1.5, 1 + (proxy.frame(in: .global).minY - fullView.size.height / 2) / fullView.size.height)))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
