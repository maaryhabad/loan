//
//  AdicionarViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 14/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
import BarcodeScanner

class AdicionarViewController: UIViewController, UINavigationControllerDelegate {
    
   

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
        
//        todasAsCategorias = Model.instance.livros.map{$0.categoria}
//        // Do any additional setup after loading the view.
//
//    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDismiss), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
//    @objc func keyboardWillShow(_ notification: NSNotification) {
//        if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//
//            UIView.animate(withDuration: 1) {
//                self.photoView.isHidden = true
//                self.infoView.transform = self.infoView.transform.translatedBy(x: 0, y: -keyboardRect.height)
//            }
//        }
//    }
//
//    @objc func keyboardWillDismiss(_ notification: NSNotification) {
//        self.photoView.isHidden = false
//        self.infoView.transform = .identity
//    }
//
    
//    @IBAction func takePhoto(_ sender: Any) {
//        imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .camera
//
//        present(imagePicker, animated: true, completion: nil)
//    }
    
    @IBAction func lerCodigo(_ sender: Any) {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.dismissalDelegate = self
        viewController.errorDelegate = self
        viewController.headerViewController.titleLabel.text = "Escaneie o código de barras"
        viewController.headerViewController.closeButton.tintColor = .red
        
        present(viewController, animated: true)
    }
    
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        imagePicker.dismiss(animated: true, completion: nil)
//        btnFoto.setBackgroundImage(info[.originalImage] as? UIImage, for: .normal)
//        btnFoto.setTitle("", for: .normal)
//        btnFoto.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 10, spread: 0)
//        image = info[.originalImage] as? UIImage
//    }
    
//    @IBAction func tocouNaView(_ sender: Any) {
//        nomeDoLivro.resignFirstResponder()
//        nomeDoAutor.resignFirstResponder()
//        ISBN.resignFirstResponder()
//        numeroDePaginas.resignFirstResponder()
//
//    }
    

    
    
    
    
}
