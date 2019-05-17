//
//  File.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 14/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import UIKit

class Model {
    static let instance = Model()
    
    private init() {
        
    }
    
    var livros = [
        Livro(nome: "Design Thinking: inovação em negócios", autor: "Maurício Vianna", capaDoLivro: UIImage(named: "design")!, ISBN: "978-85-65424-00-4", numeroDePag: 159, emprestado: false, paraQuem: ""),
        Livro(nome: "Sketching User Experiences", autor: "Saul Greenberg", capaDoLivro: UIImage(named: "sketch")!, ISBN: "978-0-12-381959-8", numeroDePag: 262, emprestado: false, paraQuem: ""),
        Livro(nome: "Não me faça pensar", autor: "Steve Krug", capaDoLivro: UIImage(named: "naofaca")!, ISBN: "978-85-7608-850-9", numeroDePag: 198, emprestado: false, paraQuem: ""),
        Livro(nome: "Design pra quem não é designer", autor: "Robin Williams", capaDoLivro: UIImage(named: "design-1")!, ISBN: "978-85-7416-387-1", numeroDePag: 191, emprestado: false, paraQuem: ""),
        Livro(nome: "Desvendando os quadrinhos", autor: "Scott McCloud", capaDoLivro: UIImage(named: "quadrinhos")!, ISBN: "85-89384-63-2", numeroDePag: 215, emprestado: false, paraQuem: "")
    ]
}
