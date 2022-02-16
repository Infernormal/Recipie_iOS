//
//  LoginViewModel.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 1/29/22.
//

import SwiftUI

struct LoginView: View {

  // 1
  @EnvironmentObject var viewModel: AuthenticationViewModel

  var body: some View {
      ZStack {
          Image("yellow")
              .edgesIgnoringSafeArea(.all)
          VStack {
            Spacer()

            // 2
            Image("logomark")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 134, height: 134)
              .padding(.top, 170)

            Text("Welcome to Recipie!")
              .fontWeight(.black)
              .foregroundColor(Color("Red"))
              .font(Font.custom("PlusJakartaSans-Bold", size: 25))
              .fontWeight(.heavy)
              .multilineTextAlignment(.center)
              .padding(.top, 100)

            Text("Keep track of your favourite recipes")
              .font(Font.custom("PlusJakartaSans-Regular", size: 18))
              .multilineTextAlignment(.center)
              .padding()

            Spacer()

            // 3
            GoogleSignInButton()
              .padding()
              .onTapGesture {
                viewModel.signIn()
              }
          }
      }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
