//
//  ListRowView.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isDone ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isDone ? .blue : .red)
            Text(item.title)
        }
    }
}

#Preview {
    ListRowView(item: ItemModel(title: "Hihi", isDone: true))
        .previewLayout(.sizeThatFits)
}
