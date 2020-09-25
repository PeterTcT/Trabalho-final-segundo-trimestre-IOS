//
//  Product.swift
//  TrabFinal35_34
//
//  Created by COTEMIG on 24/09/20.
//  Copyright © 2020 PedroRodriguesPedroOliveira. All rights reserved.
//

import Foundation

struct Product: Codable {
    public let name, description: String
    public let value: Int
    public let image: String
    
    enum CodingKeys: String, CodingKey{
        case name = "Nome"
        case description = "Description"
        case value = "Value"
        case image  = "img"
    }
}

