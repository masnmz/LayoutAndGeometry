//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Mehmet Alp Sönmez on 18/09/2024.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            
            InnerView()
                .background(.green)
            
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("LEft")
            GeometryReader { proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY) y")
                        print("Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY) y")
                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY) y")


                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct ContentView: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

#Preview {
    ContentView()
}
