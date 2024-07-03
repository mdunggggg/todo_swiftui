//
//  AddTodoView.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import SwiftUI

struct AddTodoView: View {
    
    @State var todo : String = ""
    @EnvironmentObject var viewModel : ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var showAlert : Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {
                TextField("Type something here...", text: $todo)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10), style: FillStyle())
                    .padding(.horizontal)
                
                Button(action: save, label: {
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
            .alert(isPresented: $showAlert, content: getAlert)
        }
    }
    
    func save(){
        if(todo.isEmpty){
            showAlert = true
            return
        }
        showAlert = false
        viewModel.addItem(title: todo)
        presentationMode.wrappedValue.dismiss()
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text("Your new todo must be at least 1 characters long 🥲🥲🥲"))
    }
}

#Preview {
    AddTodoView()
        .environmentObject(ListViewModel())
}
