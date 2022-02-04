//
//  ModalView.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 2/3/22.
//

import Foundation
import SwiftUI



struct ModalView: View {
    @State var name = ""
    @Environment(\.presentationMode) private var presentationMode

    @ObservedObject var model = RecipeCategoryListViewModel()
    var body: some View {
    VStack(spacing: 5) {

        TextField("Name", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())


        Button(action: {

            // Call add data
            model.addData(name: name)

            // Clear the text fields
            name = ""
            self.presentationMode.wrappedValue.dismiss()

        }, label: {
            Text("Add New Category")
        })

    }
    .padding()
}
}
