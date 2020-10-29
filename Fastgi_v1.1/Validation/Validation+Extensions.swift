//
//  Validation+Extensions.swift
//  Fastgi_v1.1
//
//  Created by Hegaro on 28/10/2020.
//

import Foundation

import ValidatedPropertyKit

extension Validation where Value == String {
    static func required(errorMessage: String = "Is Empty") -> Validation {
        return .init { value in
            value.isEmpty  ? .failure(.init(message: errorMessage)) : .success(())
        }
    }
}
