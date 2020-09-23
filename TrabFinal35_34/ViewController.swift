//
//  ViewController.swift
//  TrabFinal35_34
//
//  Created by COTEMIG on 16/09/20.
//  Copyright © 2020 PedroRodriguesPedroOliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func login(_ sender: Any) {
        let emailText = email.text ?? ""
        let passwordText = password.text ?? ""
        if(emailText.isEmpty || passwordText.isEmpty){
           let errorAlert = UIAlertController(title: "Erro", message: "No deixe nenhum campo vazio", preferredStyle: UIAlertController.Style.alert)
            errorAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(errorAlert,animated: true)
        }else{
            let url = URL()
            URLSession
        }
    }
}

