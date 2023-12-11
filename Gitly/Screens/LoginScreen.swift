//
//  LoginScreen.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            EmptyView()
                .banner(
                    data: $viewModel.errorMessageContent,
                    show: $viewModel.isErrorBannerShown
                )
            
            NavigationLink(
                destination: GitlyScreenNavigationView(navigation: .Home)
                    .navigationBarTitle("")
                    .navigationBarBackButtonHidden(true),
                isActive: $viewModel.isUserLoggedInState) {
                EmptyView()
                        .navigationBarTitle("")
                        .navigationBarBackButtonHidden(true)
            }
            
            if viewModel.loginLoadingState {
                GeometryReader { gp in
                    ZStack(alignment: .center) {
                        ProgressView() .progressViewStyle(CircularProgressViewStyle())
                            .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                            .position(x: gp.size.width / 2, y: gp.size.height / 2)
                    }
                }
            } else {
                Image(uiImage: UIImage(named: "AppIcon")!)
                    .resizable()
                    .frame(width: 210, height: 150)
                
                VStack(alignment: .leading) {
                    Text("Welcome")
                        .fontWeight(.bold)
                        .padding(10)
                        .font(.headline)
                    
                    Text("To Gitly, The New Github Client Open Source for IOS")
                        .padding(.top, 3)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                        .font(.caption)
                    
                    TextField("Enter your UserName", text: $viewModel.userNameField)
                        .padding(10)
                        .lineLimit(1)
                        .textContentType(.name)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.top, 10)
                    
                    SecureField("Enter your Token", text: $viewModel.passwordField)
                        .padding(10)
                        .lineLimit(1)
                        .textContentType(.password)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.top, 10)
                    
                    Button(action: {
                        viewModel.onLoginAccountByInformation()
                    }) {
                        Text("Login")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.top, 10)
                    
                }
                .padding(.trailing, 30)
                .padding(.leading, 30)
                
            }
            
            Spacer()
        }
            
        
        Text("Gitly, Powered By Github GraphQL Api for IOS")
            .padding(.top, 3)
            .padding(.bottom, 10)
            .padding(.leading, 10)
            .font(.caption)
    }
}

#Preview {
    LoginScreen()
}
