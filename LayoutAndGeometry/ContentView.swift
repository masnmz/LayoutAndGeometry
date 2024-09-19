//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Mehmet Alp Sönmez on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { number in
                        Text("Number \(number)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .visualEffect { content, proxy in
                                content
                                    .rotation3DEffect(
                                        .degrees(-proxy.frame(in: .global).minX / 8),
                                        axis: (x: 0.0, y: 1.0, z: 0.0)
                                    )
                              
                            }
                          
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)

    }
        
}

#Preview {
    ContentView()
}
