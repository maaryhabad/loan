//
//  DAOFirebase.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 13/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class DAOFirebase {
    
    static func save(livro: Livro){
        
        //pega o livro
        //converte pra dicionário
        //salva na nuvem
        
        let novoLivro = livro
        
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        
        var livroData: [String:Any] = livro.mapToDictionary()
        
        ref = db.collection("livros").addDocument(data: livroData){ err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
    static func loadLivros(completion: @escaping () -> ()) {
        let db = Firestore.firestore()
        
        let usuarioID = Auth.auth().currentUser!.uid
        
        let livrosFirebase = db.collection("livros").whereField("usuario", isEqualTo: usuarioID).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                //quando iniciar o app, se não tiver nenhum livro, tem que ir direto pra página de adicionar
            } else {
                
                Model.instance.livros.removeAll()
                
                
                for document in querySnapshot!.documents {
                    let livro = Livro.mapToObject(livroData: document.data())
                    Model.instance.livros.append(livro)
                    
                    print("*********************************************")
                    print("\(document.documentID) => \(document.data())")
                }
                
                completion()
                
            }
        }
    }
}
