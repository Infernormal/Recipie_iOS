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
            Image("Frame 1")
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(.clear)
                .overlay(Image("login panel"))
                .padding(.top,250)
            
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 174)
                    .padding(EdgeInsets(top: 265, leading: 0, bottom: 0, trailing: 7))
                
                Text("Welcome to Recipie!")
                    .fontWeight(.black)
                    .foregroundColor(Color("Red"))
                    .font(Font.custom("PlusJakartaSans-Bold", size: 25))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Keep track of your favourite recipes")
                    .font(Font.custom("PlusJakartaSans-Regular", size: 18))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
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
