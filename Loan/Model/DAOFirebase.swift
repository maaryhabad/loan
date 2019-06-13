//
//  DAOFirebase.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 13/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import Firebase

class DAOFirebase {
    
    func save(livro: Livro){
        // pegar livro
        // salvar na nuvem
    }
    
    static func save() {
        // Add a new document with a generated ID
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    static func load() {
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments() { (querySnapshot, err) in
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
    }
}
