//
//  dashboardViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 24/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
import Firebase
import BarcodeScanner

class dashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var ultimosView: UIView!
    @IBOutlet weak var btnAdicionar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        atualizaTresLivros()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DAOFirebase.loadLivros (){
            self.ultimosView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 6, blur: 10, spread: 2)
            self.atualizaTresLivros()
            self.collection.reloadData()
            //self.btnAdicionar.layer.cornerRadius = 10
            self.btnAdicionar.isHidden = true
        }
        
        navigationItem.hidesBackButton = true;
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Novo", style: .done, target: self, action: #selector(self.action(sender:)))

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    @objc func action(sender: UIBarButtonItem) {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self as? BarcodeScannerCodeDelegate
        viewController.dismissalDelegate = self as? BarcodeScannerDismissalDelegate
        viewController.errorDelegate = self as? BarcodeScannerErrorDelegate
        
        viewController.headerViewController.titleLabel.text = "Escaneie o código de barras"
        viewController.headerViewController.closeButton.tintColor = .red
        
        present(viewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    var tresItens = [Livro]()
    
    //TABLEVIEW
    
    
    @IBOutlet weak var collection: UICollectionView!
    
    //COLLECTIONVIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tresItens.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celula", for: indexPath) as! UltimosCollectionViewCell
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
    
    
    func atualizaTresLivros() {
        var copiaDeArrayDeLivros = Model.instance.livros
        tresItens.removeAll()
        
        for _ in 0 ... 4 {
            if let ultimoLivro = copiaDeArrayDeLivros.popLast() {
                tresItens.append(ultimoLivro)
            }
        }
    }

}
