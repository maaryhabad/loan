//
//  LivroViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 20/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
import AlamofireImage

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
    @IBOutlet weak var botaoSalvar: UIButton!
    @IBOutlet weak var lblQuem: UITextField!
    
    var clicou = false
    
    var livroSelecionado: Livro!
    
    func refreshInterface() {

//        if livroSelecionado.capaDoLivro == nil {
//            imgView.image = UIImage(named: "livroplace.png")
//        } else
        if livroSelecionado.capaDoLivro != "livroplace.png" {
            let url = URL(string: livroSelecionado.capaDoLivro)!
            imgView.af_setImage(withURL: url)
        } else {
            imgView.image = UIImage(named: "livroplace.png")
        }

//        let url = URL(fileURLWithPath: livroSelecionado.capaDoLivro)
//        imgView.af_setImage(withURL: url)
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        viewInfor.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 6, blur: 10, spread: 2)
        //emprestadoView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 6, blur: 10, spread: 2)
        gradiente.layer.cornerRadius = 10
        viewInfor.layer.cornerRadius = 10
        emprestadoView.layer.cornerRadius = 10
        botaoSalvar.layer.cornerRadius = 10
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
        
//        clicou = true
        var navigationButton = self.navigationItem.rightBarButtonItem!.title!
        print(navigationButton)
        
        if navigationButton == "Editar" { //if let?
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
            clicou = false
           
            
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
            clicou = true
        }
        
    }
    
    @IBAction func terminouDeEscolher(_ sender: Any) {
       let data =  DateFormatter.localizedString(from: datePicker.date, dateStyle: .short, timeStyle: .none)
    }
    
    @IBAction func clicouSalvar(_ sender: Any) {
        self.livroSelecionado.paraQuem = lblQuem.text!
        self.livroSelecionado.data = DateFormatter.localizedString(from: datePicker.date, dateStyle: .short, timeStyle: .none)
    }
    
    
    @IBAction func tocouNaView(_ sender: Any) {
        lblQuem.resignFirstResponder()
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
