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
        let URL = "https://www.googleapis.com/books/v1/volumes?q=isbn:"
        
        print("\(URL)\(ISBN)&key=\(apiKey)")
        
        AF.request("\(URL)\(ISBN)&key=\(apiKey)").responseJSON { response in
 
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
            
            switch response.result {
            case let .success(value):
                print("success")
                let dic = value as! [String:Any]
                completionHandler(nil)
                if dic["totalItems"] as? Int == 1 {
                    let bookDict = (dic["items"] as! [[String:Any]])[0]
                    print(bookDict)
                    let nome = (bookDict["volumeInfo"] as! [String:Any])["title"] as! String
                    print("\(nome)")
                    let autor = (bookDict["volumeInfo"] as! [String:Any])["authors"] as! String
                    
                    
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
    
//    static func convertToDictionary(text: String) -> [String: Any]? {
//        if let data = text.data(using: .utf8) {
//            do {
//                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        return nil
//    }
    
//    let dict = convertToDictionary(text: str)
    
}
//trocar a chamada da API (com a minha key e passando o isbn que sai do leitor de código de barras)
//passar o método get (do jeito que está na doc. do Alamofire
//converter o valor de JSON para dicionário (na linha 24)
//retorna do getBooks um objeto livro populado ou nil (daí se retornar new ele tem que permitir a edição do usuário
//chamar get books no BarCode+Extensions
