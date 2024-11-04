//
//  Item.swift
//  ScrollView2
//
//  Created by Maxim Dmitrochenko on 04-11-2024.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let color: Color
}

struct MockData {
    static var items = [Item(color: .blue),
                        Item(color: .cyan),
                        Item(color: .indigo),
                        Item(color: .green),
                        Item(color: .mint),
                        Item(color: .red),
                        Item(color: .yellow),
                        Item(color: .orange),]
}
