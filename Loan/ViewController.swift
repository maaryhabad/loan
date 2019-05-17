//
//  ViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 14/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.instance.livros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    @IBOutlet weak var collection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.instance.livros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celula", for: indexPath) as! CelulaCollectionViewCell
        cell.displayLivro(livro: Model.instance.livros[indexPath.row])
        // Configure the cell
        return cell
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        // Do any additional setup after loading the view.
    }


}

