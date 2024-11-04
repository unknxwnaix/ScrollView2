//
//  ContentView.swift
//  ScrollView2
//
//  Created by Maxim Dmitrochenko on 04-11-2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @State private var isWiFiOn = false
    @State private var isNotificationsEnabled = false
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
                        .containerRelativeFrame(.horizontal, count: verticalSizeClass == .regular ? 3 : 4, spacing: 10)
                        .foregroundColor(item.color)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.0)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3, y: phase.isIdentity ? 1 : 0.0)
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .automatic)
        .scrollTargetBehavior(.viewAligned)
        
        // --------------------------------------------------- //
        
        Form {
            Toggle("Wi-Fi", systemImage: "wifi", isOn: $isWiFiOn)
                .tint(.pink)
            Toggle("Wi-Fi", systemImage: isWiFiOn ? "wifi" : "wifi.circle", isOn: $isWiFiOn)
                .tint(.blue)
                .contentTransition(.symbolEffect)
            Toggle("Wi-Fi", systemImage: isWiFiOn ? "wifi" : "wifi.circle.fill", isOn: $isWiFiOn)
                .tint(.blue)
                .contentTransition(.symbolEffect)
            Toggle("Wi-Fi", systemImage: isWiFiOn ? "wifi" : "wifi.router.fill", isOn: $isWiFiOn)
                .tint(.blue)
                .contentTransition(.symbolEffect)
            
            
            if isWiFiOn {
                Text("Ринат пидор")
            }
        }
        
        VStack {
            Toggle(isWiFiOn ? "On" : "Off", systemImage: isWiFiOn ? "wifi" : "wifi.slash", isOn: $isWiFiOn)
                .font(.largeTitle)
                .tint(isWiFiOn ? .green : .red)
                .toggleStyle(.button)
                .labelStyle(.titleAndIcon)
                .contentTransition(.symbolEffect)
            
            Toggle(isNotificationsEnabled ? "Enabled" : "Disabled", systemImage: isNotificationsEnabled ? "bell.and.waves.left.and.right.fill" : "bell.slash.fill", isOn: $isNotificationsEnabled)
                .font(.largeTitle)
                .tint(isNotificationsEnabled ? .green : .red)
                .toggleStyle(.button)
                .labelStyle(.titleAndIcon)
                .contentTransition(.symbolEffect)
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    ContentView()
}
