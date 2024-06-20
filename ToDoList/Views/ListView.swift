//
//  ListView.swift
//  ToDoList
//
//  Created by Артем Сергеев on 16.06.2024.
//

import SwiftUI

struct ListView: View {
  
  @EnvironmentObject var listViewModel: ListViewModel
  
  var body: some View {
    
    ZStack {
      if listViewModel.items.isEmpty {
        NoItemsView()
          .transition(.opacity)
      } else {
        List {
          ForEach(listViewModel.items) { item in
            ListRowView(item: item)
              .onTapGesture {
                withAnimation(.linear) {
                  listViewModel.updateItem(item: item)
                }
              }
          }
          .onDelete(perform: listViewModel.deleteItem)
          .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(.plain)
      }
    }
    .navigationTitle("📒 ToDo List")
    .navigationBarItems(
      leading: EditButton(),
      trailing:
        NavigationLink("Add", destination: AddView())
    )
  }
}

#Preview {
  NavigationStack {
    ListView()
  }
  .environmentObject(ListViewModel())
}
