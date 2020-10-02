//
//  ProductInformatioViewController.swift
//  TrabFinal35_34
//
//  Created by COTEMIG on 01/10/20.
//  Copyright © 2020 PedroRodriguesPedroOliveira. All rights reserved.
//

import UIKit

class ProductInformatioViewController: UIViewController {

    @IBOutlet weak var imgInfoView: UIImageView!
    @IBOutlet weak var titleInfoLbl: UILabel!
    @IBOutlet weak var priceInfoLbl: UILabel!
    @IBOutlet weak var descInfoLbl: UILabel!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let product = product{
            print(product)
        }
     
        titleInfoLbl.text = "Nome: \((product?.name)!)"
        priceInfoLbl.text = "Preço: \((product?.value)!)R$"
        descInfoLbl.text =  "Descrição: \((product?.productDescription)!)"
        if let imageURL = URL(string: product!.img){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imgInfoView.image = image
                    }
                }
            }
        }
    }
    
    
    @IBAction func saveProductOnCart(_ sender: Any) {
        let addProductOnCartAlert = UIAlertController(title: "Sucesso", message: "Produto adicionado no carrinho :)", preferredStyle: UIAlertController.Style.alert)
        addProductOnCartAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(addProductOnCartAlert,animated: true)    }
    

}
