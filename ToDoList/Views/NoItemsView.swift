//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Артем Сергеев on 20.06.2024.
//

import SwiftUI

struct NoItemsView: View {
  
  @State var animate: Bool = false
  let secondaryAccentColor = Color("SecondaryAccentColor")
  
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        Text("There are no items!")
          .font(.title)
          .fontWeight(.semibold)
        Text("Are you a productive person? You should add a bunch of items to your  todo list")
          .padding(.bottom)
        NavigationLink {
          AddView()
        } label: {
          Text("⇨ Add something")
            .foregroundStyle(.white)
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(animate ? secondaryAccentColor: .accentColor)
            .cornerRadius(10)
        }
        .padding(.horizontal, animate ? 30: 40)
        .shadow(
          color: animate ? secondaryAccentColor.opacity(0.7): .accentColor.opacity(0.7),
          radius: 10,
          x: 0,
          y: animate ? 20: 10)
        .scaleEffect(animate ? 1.1: 1.0)
        .offset(y: animate ? -2: 2)
      }
      .frame(maxWidth: 400)
      .multilineTextAlignment(.center)
      .padding(40)
      .onAppear(perform: addAnimation)
    }
    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
  }
  
  func addAnimation() {
    guard !animate else { return }
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      withAnimation(
        Animation
          .easeInOut(duration: 2.0)
          .repeatForever()
      ) {
        animate.toggle()
      }
    }
  }
  
}

#Preview {
  NavigationStack {
    NoItemsView()
      .navigationTitle("Preview Title")
  }
}
