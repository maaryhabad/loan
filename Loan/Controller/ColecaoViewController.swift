//
//  ColecaoViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 06/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class ColecaoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var categorias = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        
        let todasAsCategorias = Model.instance.livros.map{$0.categoria}
        categorias = Array(Set(todasAsCategorias)).sorted()
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorias.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoria", for: indexPath) as! ColecoesCollectionViewCell
        cell.lblNome.text = categorias[indexPath.row]
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
