//
//  LoginModelView.swift
//  Fastgi_v1
//
//  Created by Hegaro on 27/10/2020.
//

import Foundation
import Alamofire
import Combine
import SwiftUI
import ValidatedPropertyKit

class LoginViewModel: ObservableObject {
    //validation
    @Published private(set) var brokenRules = [BrokenRule]()
    @Validated(.required(errorMessage:"por favor ingrese su num") && .range(8...8))
    var telefono:String? = ""
    
    //
    @Published var authenticated = 0
    @Published var ruta: String? = ""
    @Published var messageError: String = ""
    @Published var isloading: Bool = false
    @Published var statusResponce = false
    
    var loginResponse=Login()
    
    private var disposables: Set<AnyCancellable> = []
    
    private var testvariable: AnyPublisher<String, Never> {
        loginResponse.$ruta
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                    return ""
                }
                return response
        }
        .eraseToAnyPublisher()
    }
    
    private var ErrorPublished: AnyPublisher<String, Never> {
        loginResponse.$messageError
            .receive(on: RunLoop.main)
            .map { response in
                return response
        }
        .eraseToAnyPublisher()
    }
    
    private var isLoadingPublished: AnyPublisher<Bool, Never> {
        loginResponse.$isloading
            .receive(on: RunLoop.main)
            .map { response in
                return response
        }
        .eraseToAnyPublisher()
    }
    
    
    init(){
        testvariable
            .receive(on: RunLoop.main)
            .assign(to: \.ruta!, on: self)
            .store(in: &disposables)
        //loginResponse.me()
        
        ErrorPublished
            .receive(on: RunLoop.main)
            .assign(to: \.messageError, on: self)
            .store(in: &disposables)
        
        isLoadingPublished
            .receive(on: RunLoop.main)
            .assign(to: \.isloading, on: self)
            .store(in: &disposables)
        
        
    }
    
    func verificarCode(telefono:String,code:String) {
        loginResponse.confirmCode(telefono: telefono, pin: code)
    }
    
    //validation
    func validationInput()  {
        if self.validate() {
            
        }
    }
    
    private func validate() -> Bool {
        self.brokenRules.removeAll()
        
        let rules = [
        "Telefono name": _telefono.validationError,
        ]
        
        _ = rules.compactMap{ pair in
            guard let errormessage = pair.1?.failureReason else {
                return
            }
            self.brokenRules.append(BrokenRule(propertyName: pair.0, message: "\(errormessage)"))
        }
        return self.brokenRules.count == 0
    }
    
}
