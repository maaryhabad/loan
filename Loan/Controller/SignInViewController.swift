//
//  SignInViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 24/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var formsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDismiss), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @IBAction func entrar(_ sender: Any) {
        
        // Recuperar dados digitados
        
        if let emailRecuperado = self.email.text {
            if let senhaRecuperada = self.senha.text {
                
                // Autenticar usuário no Firebase
                let autenticacao = Auth.auth()
                autenticacao.signIn(withEmail: emailRecuperado, password: senhaRecuperada, completion: { (usuario, erro) in
                    if erro == nil {
                        if usuario == nil {
                            self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar a autenticação, tente novamente.")
                        } else {
                            // Redireciona o usuário para a tela principal
                            self.performSegue(withIdentifier: "dashboardSegue", sender: nil)
                        }
                    } else {
                        self.exibirMensagem(titulo: "Dados incorretos", mensagem: "Verifique os dados digitados e tente novamente.")
                    }
                    
                })
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func exibirMensagem (titulo: String, mensagem: String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(acaoCancelar)
        present(alerta, animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
//    @objc func keyboardWillShow(_notification: NSNotification) {
//
//        if let keyboardRect = (_notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
////            UIView.animate(withDuration: 1) {
////                self.logoView.isHidden = true
////                self.formsView.transform = self.formsView.transform.translatedBy(x: 0, y: -keyboardRect.height)
////            }
//
//        }
//
//    }
//
//    @objc func keyboardWillDismiss(_notification: NSNotification) {
//        self.logoView.isHidden = false
//        print("tá falso isso ai, okay?")
//        self.formsView.transform = .identity
//    }
    
    @IBAction func tocou(_ sender: Any) {
        email.resignFirstResponder()
        senha.resignFirstResponder()
    }
    
    
}

