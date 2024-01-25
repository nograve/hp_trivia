//
//  ContentView.swift
//  hp_trivia
//
//  Created by Ihor Zakharov on 25.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
            }.frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
