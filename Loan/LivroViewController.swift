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
    
    var livroSelecionado: Livro!
    
    func refreshInterface() {
        
        imgView.image = livroSelecionado.capaDoLivro
        nomeDoLivro.text = livroSelecionado.nome
        nomeDoAutor.text = "Nome do autor: \(livroSelecionado.autor)"
        ISBN.text = "ISBN: \(livroSelecionado.ISBN)"
        numeroDePaginas.text = "Número de páginas: \(livroSelecionado.numeroDePag)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshInterface()
        // Do any additional setup after loading the view.
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
