//
//  AddTodoView.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import SwiftUI

struct AddTodoView: View {
    
    @State var todo : String = ""
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {
                TextField("Type something here...", text: $todo)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10), style: FillStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    
                }, label: {
                    Text("Save")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10), style: FillStyle())
                        .padding(.horizontal)
                })
                Spacer()
            }
            .navigationTitle("Add an item ✍️")
        }
    }
}

#Preview {
    AddTodoView()
}
