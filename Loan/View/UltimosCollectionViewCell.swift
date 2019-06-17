//
//  UltimosCollectionViewCell.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 24/05/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
import AlamofireImage

class UltimosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCapa: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    
    func displayLivro(livro: Livro) {
        imageCapa.af_setImage(withURL: livro.capaDoLivro)
        labelNome.text = livro.nome
        
    }
}
