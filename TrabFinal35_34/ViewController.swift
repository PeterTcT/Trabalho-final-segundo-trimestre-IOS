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
        let userAuthStatus = UserDefaults.standard.bool(forKey: "LoginStatus")
        if userAuthStatus {
            self.performSegue(withIdentifier: "login", sender: self)
        }
        // Do any additional setup after loading the view.
    }


    @IBAction func login(_ sender: Any) {
        let emailText = email.text ?? ""
        let passwordText = password.text ?? ""
        if emailText.isEmpty || passwordText.isEmpty {
           let errorAlert = UIAlertController(title: "Erro", message: "Nao deixe nenhum campo vazio", preferredStyle: UIAlertController.Style.alert)
            errorAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(errorAlert,animated: true)
        } else {
            let session = URLSession.shared
            let url = URL(string: "https://trab-ios.herokuapp.com/login/\(emailText)/\(passwordText)")!
            session.dataTask(with: url) { (data, response, errr) in
                DispatchQueue.main.async {
                    if let httpResponse = response as? HTTPURLResponse {
                        if(httpResponse.statusCode == 200){
                            let saveData = UserDefaults.standard
                            saveData.set(true, forKey: "LoginStatus")
                            self.performSegue(withIdentifier: "login", sender: self)
                        }else{
                            let errorAlert = UIAlertController(title: "Erro", message: "Email ou senha incorretos", preferredStyle: UIAlertController.Style.alert)
                            errorAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(errorAlert,animated: true)                    }
                    }
                }
            }.resume()
          }
        }
    }

