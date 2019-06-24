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
        let url = URL(string: livro.capaDoLivro)!
        imageCapa.af_setImage(withURL: url)
        labelNome.text = livro.nome
        
    }
}
