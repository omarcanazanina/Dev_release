//
//  ErrorModel.swift
//  Fastgi_v1.1
//
//  Created by Hegaro on 28/10/2020.
//

import Foundation

struct ErrorR : Codable {
    var name : String
    var message: String
}

//error de token recarga
struct ErrorRecarga : Codable{
    var name: String
    var message: String
}

//error de token UpadteUser
struct ErrorUpdateUser : Codable{
    var name: String
    var message: String
}
