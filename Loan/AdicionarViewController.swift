//
//  AdicionarViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 14/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class AdicionarViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var nomeDoLivro: UITextField!
    @IBOutlet weak var nomeDoAutor: UITextField!
    @IBOutlet weak var ISBN: UITextField!
    @IBOutlet weak var numeroDePaginas: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self// as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
        
    }
    
    @IBAction func tocouNaView(_ sender: Any) {
        nomeDoLivro.resignFirstResponder()
        nomeDoAutor.resignFirstResponder()
        ISBN.resignFirstResponder()
        numeroDePaginas.resignFirstResponder()
    }
    //botao de salvar (pegar o livro = newlivro (com as informações dentro).
    
    
    @IBAction func btnSalvar(_ sender: Any) {
        var model = Livro(nome: nomeDoLivro.text!, autor: nomeDoAutor.text!, capaDoLivro: imageView.image!, ISBN: ISBN.text!, numeroDePag: Int(numeroDePaginas.text!)!, emprestado: false, paraQuem: "")
        
        Model.instance.livros.append(model)
        print(model)
        print(Model.instance.livros)
        
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "dashboard"))!
        self.present(vc, animated: true, completion: nil)
        
        //criar um novo livro,
        //inserir as informações
        
    }
    
    
}
