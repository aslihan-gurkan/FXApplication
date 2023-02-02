//
//  ExchangeCurrency.swift
//  FXApplication
//
//  Created by Aslıhan Gürkan on 1.02.2023.
//

import Foundation

struct ExchangeCurrency : Decodable {
    var status : Bool
    var code : Int
    var msg : String
    var response = [Response]()
}


