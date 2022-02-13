//
//  DetailsPageViewModel.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 2/1/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn

struct RowView: View {
  let item: String

  @State private var checked = false
  @State private var stroken = false

  var body: some View {

      Button(action:{checked.toggle();stroken.toggle()}) {
          HStack {
              Image(systemName: checked ? "checkmark.circle" : "circle")
              Text(" \(item)")
                  .strikethrough(stroken)}
      }
   }
}
