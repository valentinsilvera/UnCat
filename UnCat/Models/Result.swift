//
//  Result.swift
//  Result
//
//  Created by Valentin Silvera on 18.07.21.
//

import Foundation
import SwiftUI

struct Results : Codable {
    var total : Int
    var results : [Result]
}

struct Result: Codable, Identifiable {
    var id : String
    var username : String?
    var urls: URLs
}

struct URLs : Codable {
    var regular : String
}
