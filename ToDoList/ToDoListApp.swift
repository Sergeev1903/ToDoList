//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Артем Сергеев on 16.06.2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
  
  @StateObject var listViewModel: ListViewModel = ListViewModel()
  
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ListView()
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .environmentObject(listViewModel)
    }
  }
}
