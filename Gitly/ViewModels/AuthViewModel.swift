//
//  AuthViewModel.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import Foundation

public final class AuthViewModel: ObservableObject {
    
    @Published var userNameField: String = ""
    @Published var passwordField: String = ""
    @Published var isErrorBannerShown: Bool = false
    @Published var loginLoadingState: Bool = false
    @Published var isUserLoggedInState: Bool = false
    @Published var errorMessageContent: BannerData = BannerData(title: "", detail: "", type: .error)
    private let userRepositoryQueriesImplementation = GitlyUserQueriesImplementation()
    
    public func onLoginAccountByInformation() {
        if userNameField.isEmpty {
            self.errorMessageContent = BannerData(
                title: "Username Required!",
                detail: "Please Enter Your Github Username To Continue",
                type: .error
            )
            
            isErrorBannerShown = true
            return
        }
        
        if passwordField.isEmpty {
            self.errorMessageContent = BannerData(
                title: "Token Required!",
                detail: "Please Generate A Access Token From Your Github Profile Settings",
                type: .error
            )
            
            isErrorBannerShown = true
            return
        }
        
        self.loginLoadingState = true
        GitlyStorageKeysManager.shared.onInsertLoginInformation(username: userNameField, token: passwordField)
        DispatchQueue.global(qos: .background).async {
            self.userRepositoryQueriesImplementation.getUserInformationByUserName(onAccountResult: { logginInUser in
                self.loginLoadingState = false
                self.isErrorBannerShown = false

                self.errorMessageContent = BannerData(
                    title: "Welcome Mr. \(logginInUser.name ?? "") To Gitly",
                    detail: "You can now Access All Gitly Functions With Your Personal Account",
                    type: .success
                )
                
                self.isErrorBannerShown = true
                
                DispatchQueue.global().asyncAfter(deadline: .now() + 4.0) {
                    self.isUserLoggedInState = true
                }
            }, onAccountInvalid: {
                self.loginLoadingState = false
                self.isErrorBannerShown = false
                self.errorMessageContent = BannerData(
                    title: "Account Not Found!",
                    detail: "Make Sure to Provide A Valid Information Before Continue",
                    type: .error
                )
                
                self.isErrorBannerShown = true
            })
        }
    }
    
}
