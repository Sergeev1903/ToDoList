//
//  AddView.swift
//  ToDoList
//
//  Created by Артем Сергеев on 16.06.2024.
//

import SwiftUI

struct AddView: View {
  
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var listViewModel: ListViewModel
  @State var textFieldText: String = ""
  @State var alertTitle: String = ""
  @State var showAlert: Bool = false
  
  var body: some View {
    ScrollView {
      VStack {
        TextField("Type something here...", text: $textFieldText)
          .padding(.horizontal)
          .frame(height: 55)
          .background(Color(.secondarySystemBackground))
          .cornerRadius(10)
        
        Button(action: {
          saveButtonPressed()
        }, label: {
          Text("Save".uppercased())
            .foregroundStyle(.white)
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.accent)
            .cornerRadius(10)
        })
      }
      .padding(8)
    }
    .navigationTitle("Add an Item")
    .alert(isPresented: $showAlert, content: getAlert)
  }
  
  func saveButtonPressed() {
    if textIsAppropriate() == true {
      listViewModel.addItem(title: textFieldText)
      dismiss()
    }
  }
  
  func textIsAppropriate() -> Bool {
    if textFieldText.count < 3  {
      showAlert.toggle()
      alertTitle = "You need to enter more than two character"
      return false
    } else {
      return true
    }
  }
  
  func getAlert() -> Alert {
    Alert(title: Text(alertTitle))
  }
  
}

#Preview {
  NavigationView {
    AddView()
      .environmentObject(ListViewModel())
  }
}
