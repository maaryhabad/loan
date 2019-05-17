//
//  Livro.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 14/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import UIKit

class Livro {
    
    var nome: String
    var autor: String //colocar ISBN
    var capaDoLivro: UIImage
    var ISBN: String
    var numeroDePag: Int
    var emprestado: Bool
    var paraQuem: String
    
    init(nome: String, autor: String, capaDoLivro: UIImage, ISBN: String, numeroDePag: Int, emprestado: Bool, paraQuem: String) {
        self.nome = nome
        self.autor = autor
        self.capaDoLivro = capaDoLivro
        self.ISBN = ISBN
        self.numeroDePag = numeroDePag
        self.emprestado = emprestado
        self.paraQuem = paraQuem
    }
}
