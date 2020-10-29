//
//  UsuarioModel.swift
//  Fastgi_v1.1
//
//  Created by Hegaro on 28/10/2020.
//

import Foundation

struct Usuario : Codable {
    var role: String
    var estado: Bool
    var _id: String
    var telefono: String
    var pin: String
    var fecha: String
 
}
