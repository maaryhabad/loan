//
//  DAOFirebase.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 13/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class DAOFirebase {
    
    static func save(livro: Livro){
        
        let novoLivro = livro
        
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        
        ref = db.collection("livros").addDocument(data: [
            "nome": novoLivro.nome,
            "autor": novoLivro.autor,
            "capaDoLivro": novoLivro.capaDoLivro,
            "ISBN": novoLivro.ISBN,
            "numeroDePag": novoLivro.numeroDePag,
            "emprestado": novoLivro.emprestado,
            "paraQuem": novoLivro.paraQuem,
            "data": novoLivro.data,
            "categoria": novoLivro.categoria,
            "usuario": novoLivro.usuario
        ])  { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }
    
    static func load() {
        let db = Firestore.firestore()
        
        let usuarioID = Auth.auth().currentUser!.uid
        
        let livrosFirebase = db.collection("livros").whereField("usuario", isEqualTo: usuarioID).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                }
            }
        // pegar todos os livros
        // salvar no array
        }
        print(livrosFirebase)
    }
}
