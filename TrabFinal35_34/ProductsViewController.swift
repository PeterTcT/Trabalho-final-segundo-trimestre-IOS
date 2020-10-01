//
//  ProductsViewController.swift
//  TrabFinal35_34
//
//  Created by Pedro Henrique Oliveira Siqueira on 30/09/20.
//  Copyright © 2020 PedroRodriguesPedroOliveira. All rights reserved.
//

import UIKit
class ProductsViewController: UIViewController, UITableViewDataSource{

    final let url = URL(string: "https://trab-ios.herokuapp.com/products")
    
    private var products = [Products]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadAPI()
        tableView.tableFooterView = UIView()
    }
    
    func downloadAPI(){
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else{
                print("Algo deu Errado!")
                return
            }
            print("Downloaded!")
            do {
              let decoder  = JSONDecoder()
                let downloaded_products = try decoder.decode(Product.self, from: data)
                self.products = downloaded_products.product
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
//                print(downloaded_products.product[0].name)
            } catch{
                print("Something went wrong")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductViewCell") as? ProductCell else { return UITableViewCell()}
        
        cell.titleLabel.text = products[indexPath.row].name
        cell.priceLabel.text = products[indexPath.row].price
        cell.descriptionLabel.text = products[indexPath.row].productDescription
        
          if let imageURL = URL(string: products[indexPath.row].img){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgView.image = image
                    }
                }
            }
        }
        return cell
    }
}
