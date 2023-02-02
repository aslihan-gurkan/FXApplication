//
//  Response.swift
//  FXApplication
//
//  Created by Aslıhan Gürkan on 2.02.2023.
//

import Foundation

struct Response : Decodable {
        
    var id : String
    var s : String // Symbol
    var o : String // Open
    var h : String // High
    var l : String // Low
    var c : String // Price/Close, Currenct Price
//    var a : String // Ask
//    var b : String // Bid
//    var sp : String // Spread
    var cp : String // Change In Percentage
    var tm : String //When update last time (UTC)
    
}
