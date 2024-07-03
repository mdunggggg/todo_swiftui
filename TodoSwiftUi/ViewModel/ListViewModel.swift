//
//  ListViewModel.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items : [ItemModel] = [] {
        didSet{
            saveToDb()
        }
    }
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else{
            return
        }
        
        do {
            let decodedItems = try JSONDecoder().decode([ItemModel].self, from: data)
            self.items = decodedItems
        }
        catch{
            
        }
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
    
    func saveToDb(){
        do{
           let encodedData = try JSONEncoder().encode(items)
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
        catch{
            print("error when saving to db \(error)")
        }
    }
}
