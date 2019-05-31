//
//  LivroViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 20/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class LivroViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nomeDoLivro: UILabel!
    @IBOutlet weak var nomeDoAutor: UILabel!
    @IBOutlet weak var ISBN: UILabel!
    @IBOutlet weak var numeroDePaginas: UILabel!
    @IBOutlet weak var viewInfor: UIView!
    @IBOutlet weak var emprestadoView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var gradiente: UIImageView!
    
    var livroSelecionado: Livro!
    
    func refreshInterface() {
        
        imgView.image = livroSelecionado.capaDoLivro
        nomeDoLivro.text = livroSelecionado.nome
        nomeDoAutor.text = livroSelecionado.autor
        ISBN.text = "ISBN: \(livroSelecionado.ISBN)"
        numeroDePaginas.text = "\(livroSelecionado.numeroDePag) páginas"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshInterface()
        datePicker.setValue(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), forKeyPath: "textColor")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        viewInfor.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 6, blur: 10, spread: 2)
        emprestadoView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 6, blur: 10, spread: 2)
        gradiente.layer.cornerRadius = 10
        viewInfor.layer.cornerRadius = 10
        emprestadoView.layer.cornerRadius = 10
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
