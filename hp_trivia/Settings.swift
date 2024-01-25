//
//  Settings.swift
//  hp_trivia
//
//  Created by Ihor Zakharov on 25.01.2024.
//

import SwiftUI

enum BookStatus {
    case active
    case inactive
    case locked
}

struct Settings: View {
    @Environment(\.dismiss) private var dismiss
    @State private var books: [BookStatus] = [.active, .active, .inactive, .locked, .locked, .locked, .locked]
    
    var body: some View {
        ZStack {
            InfoBackgroundImage()
            
            VStack {
                // Title
                Text("Which books would you like to see questions from?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(0..<7) { i in
                            // Active
                            if books[i] == .active {
                                ZStack(alignment: .bottomTrailing) {
                                    Image("hp\(i+1)")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(radius: 7)
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .foregroundColor(.green)
                                        .shadow(radius: 1)
                                        .padding(3)
                                }
                                .onTapGesture {
                                    books[i] = .inactive
                                }
                                // Inactive
                            } else if books[i] == .inactive {
                                ZStack(alignment: .bottomTrailing) {
                                    Image("hp\(i+1)")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(radius: 7)
                                        .overlay(Rectangle().opacity(0.33))
                                    
                                    Image(systemName: "circle")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .foregroundColor(.green.opacity(0.5))
                                        .shadow(radius: 1)
                                        .padding(3)
                                }
                                .onTapGesture {
                                    books[i] = .active
                                }
                                // Locked
                            } else {
                                ZStack {
                                    Image("hp\(i+1)")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(radius: 7)
                                        .overlay(Rectangle().opacity(0.75))
                                    
                                    Image(systemName: "lock.fill")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .shadow(color: .white.opacity(0.75), radius: 3)
                                        .padding(3)
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                // Done button
                Button("Done") {
                    dismiss()
                }
                .doneButton()
            }
        }
    }
}

#Preview {
    Settings()
}
