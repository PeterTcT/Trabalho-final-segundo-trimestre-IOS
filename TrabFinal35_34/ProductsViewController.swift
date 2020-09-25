//
//  ProductsViewController.swift
//  TrabFinal35_34
//
//  Created by COTEMIG on 16/09/20.
//  Copyright © 2020 PedroRodriguesPedroOliveira. All rights reserved.
//

import UIKit
class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return p_array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ProductCell{
        let product = p_array[indexPath.row]
        cell.productTitle.text = product.name
        cell.productDescription.text = product.description
        cell.productPrice.text = String(product.value)
        cell.imageProduct.image = UIImage(named: p_array[indexPath.row].image)
        return cell
    }
        else{
        fatalError("Erro na célula!")
    }
}

    private func api(){
        let url = URL(string: "https://trab-ios.herokuapp.com/products")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                do {
                    let productAPI = try JSONDecoder().decode([Product].self, from: data)

                    self.p_array.append(contentsOf: productAPI)
                    DispatchQueue.main.async {
                    self.tableView.reloadData()
                    }
                }catch{
                    print("Erro de parse!")
                }
            }
        }.resume()
    }
        
//
////        func api(completion: @escaping (Product) ->()){
////            let urlString = "https://trab-ios.herokuapp.com/products"
////            if let url = URL(string: urlString){
////                URLSession.shared.dataTask(with: url) { data, res, err in
////                    if let data = data {
////                        print("hey")
////
////                        let decoder = JSONDecoder()
////                        if let json = try? decoder.decode(Product.self, from: data){
////                            completion(json)
////                        }
////                    }
////                    }.resume()
////            }
////        }

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var p_array: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        api()
    }
}



//extension ViewController: UITableViewDelegate, UITableViewDataSource{
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return p_array.count
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ProductCell{
//                let product = p_array[indexPath.row]
//                cell.productTitle.text = product.name
//                cell.productDescription.text = product.description
//                cell.productPrice.text = String(product.value)
//                cell.imageProduct.image = UIImage(named: product[indexPath.row])
//                return cell
//            }
//            else{
//                fatalError("Erro na célula!")
//            }
//        }
//
//    }



