//
//  ViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 14/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var tresItens = [Livro]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.instance.livros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! TableViewCell
        tableCell.displayLivro(livro: Model.instance.livros[indexPath.row])
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Todos os livros"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tá entrando na table")
        if let vc = storyboard?.instantiateViewController(withIdentifier: "livro") as? LivroViewController {
            vc.livroSelecionado = Model.instance.livros[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var table: UITableView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tresItens.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celula", for: indexPath) as! CelulaCollectionViewCell
        cell.displayLivro(livro: tresItens[indexPath.row])
        // Configure the cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tá entrando na collection")
        if let vc = storyboard?.instantiateViewController(withIdentifier: "livro") as? LivroViewController {
            vc.livroSelecionado = tresItens[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        atualizaTresLivros()
        self.collection.reloadData()
        self.table.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        table.delegate = self
        table.dataSource = self
        atualizaTresLivros()
        
        // Do any additional setup after loading the view.
    }
    
    func atualizaTresLivros() {
        var copiaDeArrayDeLivros = Model.instance.livros
        tresItens.removeAll()
        
        for _ in 0 ... 2 {
            if let ultimoLivro = copiaDeArrayDeLivros.popLast() {
                tresItens.append(ultimoLivro)
            }
        }
    }


}


