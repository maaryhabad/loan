//
//  AdicionarViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 14/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class AdicionarViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return todasAsCategorias.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return todasAsCategorias[row]
    }

    var image: UIImage!
    
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var nomeDoLivro: UITextField!
    @IBOutlet weak var nomeDoAutor: UITextField!
    @IBOutlet weak var ISBN: UITextField!
    @IBOutlet weak var numeroDePaginas: UITextField!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var btnFoto: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var gradiente: UIImageView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var categoriaPicker: UIPickerView!
    
    var todasAsCategorias = [String]()
    
    var emprestado = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoriaPicker.delegate = self
        self.categoriaPicker.dataSource = self
        
        todasAsCategorias = Model.instance.livros.map{$0.categoria}
        // Do any additional setup after loading the view.
        
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDismiss), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            UIView.animate(withDuration: 1) {
                self.photoView.isHidden = true
                self.infoView.transform = self.infoView.transform.translatedBy(x: 0, y: -keyboardRect.height)
            }
        }
    }
    
    @objc func keyboardWillDismiss(_ notification: NSNotification) {
        self.photoView.isHidden = false
        self.infoView.transform = .identity
    }
    
    override func viewWillAppear(_ animated: Bool) {
        photoView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 6, blur: 10, spread: 2)
        infoView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 6, blur: 10, spread: 2)
        photoView.layer.cornerRadius = 10
        gradiente.layer.cornerRadius = 10
        infoView.layer.cornerRadius = 10
        btnSave.layer.cornerRadius = 10
        categoriaPicker.setValue(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), forKeyPath: "textColor")

    }
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        btnFoto.setBackgroundImage(info[.originalImage] as? UIImage, for: .normal)
        btnFoto.setTitle("", for: .normal)
        btnFoto.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 10, spread: 0)
        image = info[.originalImage] as? UIImage
    }
    
    @IBAction func tocouNaView(_ sender: Any) {
        nomeDoLivro.resignFirstResponder()
        nomeDoAutor.resignFirstResponder()
        ISBN.resignFirstResponder()
        numeroDePaginas.resignFirstResponder()
        
    }
    
    @IBAction func btnSalvar(_ sender: Any) {
        let model = Livro(nome: nomeDoLivro.text!, autor: nomeDoAutor.text!, capaDoLivro: image, ISBN: ISBN.text!, numeroDePag: Int(numeroDePaginas.text!)!, emprestado: false, paraQuem: "", data: "", categoria: "") //tem que salvar a categoria selecionada pelo picker
        
        Model.instance.livros.append(model)
        print(model)
        print(Model.instance.livros)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
}
