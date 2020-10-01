//
//  Product.swift
//  TrabFinal35_34
//
//  Created by Pedro Henrique Oliveira Siqueira on 30/09/20.
//  Copyright © 2020 PedroRodriguesPedroOliveira. All rights reserved.
//

import UIKit

class Product: Codable{
    let product: [Products]
    
    init(product: [Products]) {
        self.product = product
    }
}


class Products: Codable {
    let name: String
    let price: String
    let productDescription: String
    let img: String

    enum CodingKeys: String, CodingKey {
           case name = "Name"
           case price = "Value"
           case productDescription = "Description"
           case img
       }
}
