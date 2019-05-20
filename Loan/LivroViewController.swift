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
    
    var livroSelecionado = 0
    
    func refreshInterface() {
        let escolhido = Model.instance.livros[livroSelecionado]
        
        imgView.image = escolhido.capaDoLivro
        nomeDoLivro.text = escolhido.nome
        nomeDoAutor.text = "Nome do autor: \(escolhido.autor)"
        ISBN.text = "ISBN: \(escolhido.ISBN)"
        numeroDePaginas.text = "Número de páginas: \(escolhido.numeroDePag)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
