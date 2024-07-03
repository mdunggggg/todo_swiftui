//
//  ListView.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import SwiftUI

struct ListView: View {
    
    @State var items : [ItemModel] = [
        ItemModel(title: "Do housework", isDone: false),
        ItemModel(title: "Do homework", isDone: false),
        ItemModel(title: "Sleep", isDone: true)
    ]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(items){ item in
                    ListRowView(item: item)
                }
                .onDelete(perform: { indexSet in
                    
                })
            }
            .navigationTitle("Todo List 📝")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .foregroundStyle(.blue)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add", destination: AddTodoView())
                }
            })
        }
    }
}

#Preview {
    ListView()
}
