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
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var btnFoto: UIButton!
    
    
    
    var emprestado = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        photoView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 6, blur: 10, spread: 2)
        photoView.layer.cornerRadius = 10
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self// as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        btnFoto.setBackgroundImage(info[.originalImage] as? UIImage, for: .normal)
        btnFoto.setTitle("", for: .normal)
        btnFoto.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 10, spread: 0)
        
    }
    
    @IBAction func tocouNaView(_ sender: Any) {
        nomeDoLivro.resignFirstResponder()
        nomeDoAutor.resignFirstResponder()
        ISBN.resignFirstResponder()
        numeroDePaginas.resignFirstResponder()
    }
    //botao de salvar (pegar o livro = newlivro (com as informações dentro).
    
    
    @IBAction func btnSalvar(_ sender: Any) {
        let model = Livro(nome: nomeDoLivro.text!, autor: nomeDoAutor.text!, capaDoLivro: imageView.image!, ISBN: ISBN.text!, numeroDePag: Int(numeroDePaginas.text!)!, emprestado: false, paraQuem: "")
        
        Model.instance.livros.append(model)
        print(model)
        print(Model.instance.livros)
        
        self.navigationController?.popViewController(animated: true)
        
        //criar um novo livro,
        //inserir as informações
        
    }
    

    
    
    
}
