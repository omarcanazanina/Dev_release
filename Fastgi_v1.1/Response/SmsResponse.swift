//
//  SmsResponse.swift
//  Fastgi_v1.1
//
//  Created by Hegaro on 28/10/2020.
//

import Foundation

struct SmsResponse: Codable {
    var ok :Bool
    var usuario : Usuario
    
}

struct ErrorResponse:Codable {
    var ok : Bool
    var err : ErrorR
}

struct LoginSmsResponse:Codable {
    var ok :Bool
    var usuario : Usuario
    var token : String
}
