//
//  ContentView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 09/12/2023.
//

import SwiftUI
import SwiftData
import GithubGraphQlApi

struct OnBoardingScreen: View {
    
    @Binding var onLoginScreenDirection: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(uiImage: UIImage(named: "OnBoardingImage")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    
                    NavigationLink(
                        destination: LoginScreen(),
                        isActive: $onLoginScreenDirection
                    ){
                        Button(action: {
                            onLoginScreenDirection = true
                        }) {
                            Text("Continue")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                        }
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(.bottom, 80)
                        .padding(.leading, 60)
                        .padding(.trailing, 60)
                    }
                                }
                    
            }
            .ignoresSafeArea()
        }
    }


}

