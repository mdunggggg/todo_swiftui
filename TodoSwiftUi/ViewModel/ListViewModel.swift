//
//  ListViewModel.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items : [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems(){
        items.append(
            contentsOf: [
                ItemModel(title: "Do housework", isDone: false),
                ItemModel(title: "Do homework", isDone: false),
                ItemModel(title: "Sleep", isDone: true)
            ]
        )
    }
    
    func onDelete(at index : IndexSet){
        items.remove(atOffsets: index)
    }
    
    func onMove(from start : IndexSet, to end : Int){
        items.move(fromOffsets: start, toOffset: end)
    }
    
    func addItem(title : String){
        let newItem = ItemModel(title: title, isDone: false)
        items.append(newItem)
    }
    
    func update(item : ItemModel){
        if let index = items.firstIndex(where: { itemModel in
            itemModel.id == item.id
        }){
            items[index] = items[index].updateDone()
        }
    }
}
