//
//  ListView.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel : ListViewModel
    
    var body: some View {
        NavigationStack{
            if viewModel.items.isEmpty {
                Text("Nothing to do")
            }
            List{
                ForEach(viewModel.items){ item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.spring){
                                viewModel.update(item: item)
                            }
                        }
                }
                .onDelete(perform: viewModel.onDelete)
                .onMove(perform: viewModel.onMove)
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
        .environmentObject(ListViewModel())
}
