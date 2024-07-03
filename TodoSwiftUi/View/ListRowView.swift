//
//  ListRowView.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import SwiftUI

struct ListRowView: View {
    
    let title : String
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
        }
    }
}

#Preview {
    ListRowView(title: "")
}
