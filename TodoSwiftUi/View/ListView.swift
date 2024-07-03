//
//  ListView.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import SwiftUI

struct ListView: View {
    
    @State var items : [String] = [
        "Do housework","Do homework", "Sleep"
    ]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(items, id: \.self){ item in
                    ListRowView(title: item)
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
