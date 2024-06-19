//
//  ListRowView.swift
//  ToDoList
//
//  Created by Артем Сергеев on 16.06.2024.
//

import SwiftUI

struct ListRowView: View {
  
  let item: ItemModel
  
  var body: some View {
    HStack {
      Image(systemName: item.isCompleted ? "checkmark.circle": "circle" )
        .foregroundColor(item.isCompleted ? .green: .red)
      Text(item.title)
      Spacer()
    }
    .font(.title2)
    .padding(.vertical, 8)
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  let previewItem1 = ItemModel(title: "Preview Item1", isCompleted: true)
  let previewItem2 = ItemModel(title: "Preview Item2", isCompleted: false)
  
  return Group {
    ListRowView(item: previewItem1)
    ListRowView(item: previewItem2)
  }
  .padding(8)
}

#Preview(traits: .sizeThatFitsLayout) {
  let previewItem1 = ItemModel(title: "Preview Item1", isCompleted: true)
  
  return  ListRowView(item: previewItem1)
}

#Preview(traits: .sizeThatFitsLayout) {
  let previewItem2 = ItemModel(title: "Preview Item2", isCompleted: false)
  
  return  ListRowView(item: previewItem2)
}

