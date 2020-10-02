//
//  Product.swift
//  TrabFinal35_34
//
//  Created by Pedro Henrique Oliveira Siqueira on 30/09/20.
//  Copyright © 2020 PedroRodriguesPedroOliveira. All rights reserved.
//

import UIKit

struct Products: Codable {
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case products = "Products"
    }
}

struct Product: Codable {
    let name: String
    let value: Int
    let productDescription: String
    let img: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
        case productDescription = "Description"
        case img
    }
}
