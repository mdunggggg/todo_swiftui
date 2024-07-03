//
//  ItemModel.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import Foundation

struct ItemModel : Identifiable, Encodable, Decodable{
    let id : String
    let title : String
    let isDone : Bool
    
    init(id: String = UUID().uuidString, title : String, isDone: Bool) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
    
    func updateDone() -> ItemModel {
        return ItemModel(id: id, title: title, isDone: !isDone)
    }
}
