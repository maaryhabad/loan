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
    var autor: [String] //colocar ISBN
    var capaDoLivro: String
    var ISBN: String
    var numeroDePag: Int
    var emprestado: Bool
    var paraQuem: String
    var data: String
    var categoria: String
    
    init(nome: String, autor: [String], capaDoLivro: String, ISBN: String, numeroDePag: Int, emprestado: Bool, paraQuem: String, data: String, categoria: String) {
        self.nome = nome
        self.autor = autor
        self.capaDoLivro = capaDoLivro
        self.ISBN = ISBN
        self.numeroDePag = numeroDePag
        self.emprestado = emprestado
        self.paraQuem = paraQuem
        self.data = data
        self.categoria = categoria
    }
}
