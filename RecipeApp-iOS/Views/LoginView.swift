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
          Image("light")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(minWidth: 0,maxWidth: .infinity)
          VStack {
            Spacer()

            // 2
            Image("logo-1")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 134, height: 134)
              .padding(.top, 170)

            Text("Welcome to Recipie!")
              .fontWeight(.black)
              .foregroundColor(Color("Orange"))
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
//    VStack {
//      Spacer()
//
//      // 2
//      Image("logo_no_b")
//        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .frame(width: 100, height: 100)
//        .padding(.top, 170)
//
//      Text("Welcome to Recipie!")
//        .fontWeight(.black)
//        .foregroundColor(Color("Orange"))
//        .font(Font.custom("PlusJakartaSans-Bold", size: 25))
//        .fontWeight(.heavy)
//        .multilineTextAlignment(.center)
//
//      Text("Keep track of your favourite recipes")
//        .font(Font.custom("PlusJakartaSans-Bold", size: 18))
//        .multilineTextAlignment(.center)
//        .padding()
//
//      Spacer()
//
//      // 3
//      GoogleSignInButton()
//        .padding()
//        .onTapGesture {
//          viewModel.signIn()
//        }
//    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
