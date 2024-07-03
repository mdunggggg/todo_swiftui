//
//  ItemModel.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import Foundation

struct ItemModel : Identifiable{
    let id : String = UUID().uuidString
    let title : String
    let isDone : Bool
}
