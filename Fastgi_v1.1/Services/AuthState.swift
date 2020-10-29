//
//  AuthState.swift
//  Fastgi_v1.1
//
//  Created by Hegaro on 28/10/2020.
//

import Foundation

class AuthState: ObservableObject {
    @Published var navigateBack: Bool = false
    @Published var isAuth : Bool = false
    private let storage = UserDefaults.standard
    
    init() {
        self.validAuth()
    }
    
    private func validAuth(){
        if storage.string(forKey: "token") != nil{
            isAuth = true
        }
    }
}
