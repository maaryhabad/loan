//
//  DAOGoogleBooks.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 14/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import Alamofire

class DAOGoogleBooksAPI {
    
    
    static func getBook(ISBN: String, completionHandler: @escaping (Livro?) -> ()) {
        
        let apiKey = "AIzaSyDvWzT9jQnYLFhuKQf3-mTS7NsQ4fiaxg8"
        let apiURL = "https://www.googleapis.com/books/v1/volumes?q=isbn:"
        
        print("\(apiURL)\(ISBN)&key=\(apiKey)")
        
        Alamofire.request("\(apiURL)\(ISBN)&key=\(apiKey)").responseJSON { response in
            
            switch response.result {
            case let .success(value):
                print("success")
                let dic = value as! [String:Any]
                completionHandler(nil)
                if dic["totalItems"] as? Int == 1 {
                    let bookDict = (dic["items"] as! [[String:Any]])[0]
                    
                    print(bookDict) // ***fazer conferência de dados da API! Se existe ou não***
                    let nome = (bookDict["volumeInfo"] as! [String:Any])["title"] as! String
                    let autor = (bookDict["volumeInfo"] as! [String:Any])["authors"] as! [String]
                    let numeroDePag = (bookDict["volumeInfo"] as! [String:Any])["pageCount"] as! Int
                    
                    
                    let capa = (bookDict["volumeInfo"] as! [String:Any])
                    
                    if let imageLinks = capa["imageLinks"] as? [String: Any] {
                        let strDaImagem = imageLinks["thumbnail"] as! String
                        if let url = URL(string: strDaImagem) {
                            var novoLivro = Livro(nome: nome, autor: autor, capaDoLivro: strDaImagem, ISBN: ISBN, numeroDePag: numeroDePag, emprestado: false, paraQuem: "", data: "", categoria: "")
                            Model.instance.livros.append(novoLivro)
                            DAOFirebase.save(livro: novoLivro)
                        }
                        
                    } else {
                        let stringDaImagem = "https://ixxidesign.azureedge.net/media/1676570/Mickey-Mouse-1.jpg?mode=max&width=562&height=613"
                        
                        let url = URL(string: stringDaImagem)!
                        var novoLivro = Livro(nome: nome, autor: autor, capaDoLivro: stringDaImagem, ISBN: ISBN, numeroDePag: numeroDePag, emprestado: false, paraQuem: "", data: "", categoria: "")
                        Model.instance.livros.append(novoLivro)
                        DAOFirebase.save(livro: novoLivro)
                    }
//                    let capaDoLivro = (bookDict["volumeInfo"] as! [String:Any])["thumbnail"] as? String
                    print("***************\n\n\n\(nome)\n\(autor)\n\(ISBN)\n\(numeroDePag)\n\(capa)***************")
                    
                    
                    
                    
//                    let capaDoLivro: UIImage
//                    if let data = try? Data(contentsOf: urlDaImagem!) {
//                        capaDoLivro = UIImage(data: data)!
//                        novoLivro.capaDoLivro = capaDoLivro
//                        Model.instance.livros.append(novoLivro)
//                    } else {
//                        Model.instance.livros.append(novoLivro)
//                    }
                    
                    
                    

//                    
//                    let novoLivro = Livro(nome: nome, autor: autor, capaDoLivro: capaDoLivro!, ISBN: ISBN, numeroDePag: numeroDePag, emprestado: false, paraQuem: "", data: "", categoria: "")
                    
                   // print(Model.instance.livros)
                    
                } else {
                    completionHandler(nil)
                }
                
            case let .failure(error):
                print("error")
                print(error)
                completionHandler(nil)
            }

        }
    }
    
    
}

