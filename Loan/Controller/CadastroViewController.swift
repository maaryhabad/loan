//
//  CadastroViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 24/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CadastroViewController: UIViewController {
    
    
    @IBOutlet weak var nomeCompleto: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var senhaConfirmacao: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func exibirMensagem(titulo: String, mensagem: String){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(acaoCancelar)
        present(alerta, animated: true, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func criarConta(_ sender: Any) {
        // Recuperar dados digitados
        
        if let emailRecuperado = self.email.text {
            if let nomeCompletoRecuperado = self.nomeCompleto.text {
                if let senhaRecuperada = self.senha.text {
                    if let senhaConfirmacaoRecuperada = self.senhaConfirmacao.text {
                        
                        //validar senha
                        if senhaRecuperada == senhaConfirmacaoRecuperada {
                            //validação do nome
                            if nomeCompletoRecuperado != ""{
                                // criar conta no Firebase
                                let autenticacao = Auth.auth()
                                autenticacao.createUser(withEmail: emailRecuperado, password: senhaRecuperada, completion: {(usuario, erro) in
                                    if erro == nil {
                                        if usuario == nil {
                                            self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar a autenticação, tente novamente.")
                                        } else {
                                            let database = Database.database().reference()
                                            let usuarios = database.child("usuarios")
                                            let usuarioDados = ["nome": nomeCompletoRecuperado, "email": emailRecuperado]
                                            usuarios.child((usuario?.user.uid)!).setValue(usuarioDados)
                                            
                                            //redireciona usuario para a tela principal
                                            self.performSegue(withIdentifier: "primeiraTela", sender: nil)
                                        }
                                    } else {
                                        /* ERROR_INVALID_EMAIL
                                           ERROR_WEEK_PASSWORD
                                           ERROR_EMAIL_ALREADY_IN_USE
                                         */
                                        
                                        let erroR = erro! as NSError
                                        if let codigoErro = erroR.userInfo["error_name"] {
                                            let erroTexto = codigoErro as! String
                                            var mensagemErro = ""
                                            
                                            switch erroTexto {
                                            case "ERROR_INVALID_EMAIL":
                                                mensagemErro = "Email inválido, digite novamente."
                                                break
                                            case "ERROR_WEEK_PASSWORD":
                                                mensagemErro = "Sua senha precisa ter no mínimo 6 caracteres, com letras e números."
                                                break
                                            case "ERROR_EMAIL_ALREADY_IN_USE":
                                                mensagemErro = "Esse email já está sendo usado, crie sua conta novamente."
                                                break
                                            default:
                                                mensagemErro = "Dados digitados estão incorretos, tente novamente."
                                            }
                                            self.exibirMensagem(titulo: "Dados Inválidos", mensagem: mensagemErro)
                                        }
                                    } //Fim da Validação de erro do Firebase
                                })
                            } else {
                                self.exibirMensagem(titulo: "Dados incorretos", mensagem: "As senhas não estão iguais, tente novamente.")
                            } //Fim da validação de senha
                        }
                    }
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
