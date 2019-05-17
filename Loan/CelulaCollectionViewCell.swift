//
//  CelulaCollectionViewCell.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 17/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class CelulaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTxt: UILabel!
    
    
    func displayLivro(livro: Livro) {
        imgView.image = livro.capaDoLivro
        lblTxt.text = livro.nome
        
        
    }
    
}
