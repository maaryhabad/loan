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
    var usuario: String
    
    init(nome: String, autor: [String], capaDoLivro: String, ISBN: String, numeroDePag: Int, emprestado: Bool, paraQuem: String, data: String, categoria: String, usuario: String) {
        self.nome = nome
        self.autor = autor
        self.capaDoLivro = capaDoLivro
        self.ISBN = ISBN
        self.numeroDePag = numeroDePag
        self.emprestado = emprestado
        self.paraQuem = paraQuem
        self.data = data
        self.categoria = categoria
        self.usuario = usuario
    }
    
    func mapToDictionary() -> [String: Any] {
        
        var livroData: [String:Any] = [:]
        
        livroData["nome"] = self.nome
        livroData["autor"] = self.autor
        livroData["capaDoLivro"] = self.capaDoLivro
        livroData["ISBN"] = self.ISBN
        livroData["numeroDePag"] = self.numeroDePag
        livroData["emprestado"] = self.emprestado
        livroData["paraQuem"] = self.paraQuem
        livroData["data"] = self.data
        livroData["categoria"] = self.categoria
        livroData["usuario"] = self.usuario
        
        return livroData
    }
    
    static func mapToObject(livroData: [String: Any]) -> Livro {
        
        let nome: String = livroData["nome"] as! String
        let autor: [String] = livroData["autor"] as! [String]
        let capaDoLivro: String = livroData["capaDoLivro"] as! String
        let ISBN: String = livroData["ISBN"] as! String
        let numeroDePag: Int = livroData["numeroDePag"] as! Int
        let emprestado: Bool = (livroData["emprestado"] != nil)
        let paraQuem: String = livroData["paraQuem"] as! String
        let data: String = livroData["data"] as! String
        let categoria: String = livroData["categoria"] as! String
        let usuario: String = livroData["usuario"] as! String
        
        
        let livro = Livro(nome: nome, autor: autor, capaDoLivro: capaDoLivro, ISBN: ISBN, numeroDePag: numeroDePag, emprestado: emprestado, paraQuem: paraQuem, data: data, categoria: categoria, usuario: usuario)
        
        return livro
    }
    
}
