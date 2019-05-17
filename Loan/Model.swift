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
        Livro(nome: "Design Thinking: inovação em negócios", autor: "Maurício Vianna", capaDoLivro: UIImage(named: "design")!, ISBN: "978-85-65424-00-4", numeroDePag: 159, emprestado: false, paraQuem: "")
    ]
}
