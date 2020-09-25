//
//  ProductViewCell.swift
//  TrabFinal35_34
//
//  Created by COTEMIG on 24/09/20.
//  Copyright © 2020 PedroRodriguesPedroOliveira. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
