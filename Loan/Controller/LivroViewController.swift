//
//  LivroViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 20/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
import AlamofireImage
import FirebaseAuth

class LivroViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nomeDoLivro: UITextView!
    @IBOutlet weak var nomeDoAutor: UITextView!
    @IBOutlet weak var numeroDePaginas: UITextField!
    @IBOutlet weak var ISBN: UITextField!
    @IBOutlet weak var viewInfor: UIView!
    @IBOutlet weak var emprestadoView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var gradiente: UIImageView!
    @IBOutlet weak var lblQuem: UITextField!
    
    
    var livroSelecionado: Livro!
    
    let usuarioID = Auth.auth().currentUser!.uid
    
    func refreshInterface() {
        
        //verificar se o livro é nulo ou não!!!!!!
        
        if livroSelecionado == nil {
            imgView.image = UIImage(named: "livroplace.png")
            
        } else {
            
            if livroSelecionado.capaDoLivro != "livroplace.png" {
                let url = URL(string: livroSelecionado.capaDoLivro)!
                imgView.af_setImage(withURL: url)
            } else {
                imgView.image = UIImage(named: "livroplace.png")
                nomeDoLivro.text = livroSelecionado.nome
                var autores = ""
                
                for autor in livroSelecionado.autor {
                    autores += "\(autor), "
                }
                
                print(autores)
                
                nomeDoAutor.text = autores
                ISBN.text = "ISBN: \(livroSelecionado.ISBN)"
                numeroDePaginas.text = "\(livroSelecionado.numeroDePag) páginas"
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        viewInfor.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 6, blur: 10, spread: 2)
        //emprestadoView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 6, blur: 10, spread: 2)
        gradiente.layer.cornerRadius = 10
        viewInfor.layer.cornerRadius = 10
        emprestadoView.layer.cornerRadius = 10
        datePicker.setValue(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), forKeyPath: "textColor")
        refreshInterface()
        
        nomeDoAutor.isUserInteractionEnabled = false
        nomeDoLivro.isUserInteractionEnabled = false
        numeroDePaginas.isUserInteractionEnabled = false
        ISBN.isUserInteractionEnabled = false
        let selectedBackgroundColor = UIColor.init(red: 66/255, green: 66/255, blue: 79/255, alpha: 0)
        
        nomeDoAutor.backgroundColor = selectedBackgroundColor
        nomeDoLivro.backgroundColor = selectedBackgroundColor
        numeroDePaginas.backgroundColor = selectedBackgroundColor
        ISBN.backgroundColor = selectedBackgroundColor
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Editar", style: .done, target: self, action: #selector(self.action(sender:)))
        //se a data tiver alguma coisa, o date picker tem que ficar com a data que tem no modelo, se não, ele tem que abrir com o dia de hoje.
    }
    
    @objc func action(sender: UIBarButtonItem) {
        
        let navigationButton = self.navigationItem.rightBarButtonItem!.title!
        
        if navigationButton == "Editar" {
            print("aqui o usuário pode editar")
            
            self.navigationItem.rightBarButtonItem!.title! = "Salvar"
            
            nomeDoAutor.isUserInteractionEnabled = true
            nomeDoLivro.isUserInteractionEnabled = true
            numeroDePaginas.isUserInteractionEnabled = true
            ISBN.isUserInteractionEnabled = true
            
            print("clicou no botão")
            
            let selectedBackgroundColor = UIColor.init(red: 66/255, green: 66/255, blue: 79/255, alpha: 0.3)
            
            nomeDoAutor.backgroundColor = selectedBackgroundColor
            nomeDoLivro.backgroundColor = selectedBackgroundColor
            numeroDePaginas.backgroundColor = selectedBackgroundColor
            ISBN.backgroundColor = selectedBackgroundColor
            
           
            
        } else {
            print("aqui não pode editar")
            self.navigationItem.rightBarButtonItem!.title! = "Editar"
            
            nomeDoAutor.isUserInteractionEnabled = false
            nomeDoLivro.isUserInteractionEnabled = false
            numeroDePaginas.isUserInteractionEnabled = false
            ISBN.isUserInteractionEnabled = false
            let selectedBackgroundColor = UIColor.init(red: 66/255, green: 66/255, blue: 79/255, alpha: 0)
            
            nomeDoAutor.backgroundColor = selectedBackgroundColor
            nomeDoLivro.backgroundColor = selectedBackgroundColor
            numeroDePaginas.backgroundColor = selectedBackgroundColor
            ISBN.backgroundColor = selectedBackgroundColor
            
            let data =  DateFormatter.localizedString(from: datePicker.date, dateStyle: .short, timeStyle: .none)
            
            let numeroInt = Int(numeroDePaginas.text!)
            
            var novoLivro = Livro(nome: nomeDoLivro.text, autor: [nomeDoAutor!.text], capaDoLivro: "livroplace.png", ISBN: ISBN.text!, numeroDePag: numeroInt!, emprestado: false, paraQuem: lblQuem.text!, data: data, categoria: "", usuario: usuarioID)
            Model.instance.livros.append(novoLivro)
            DAOFirebase.save(livro: novoLivro)
            
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
