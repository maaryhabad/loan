//
//  ColecoesCollectionViewCell.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 06/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class ColecoesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var lblNome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblNome.layer.borderColor = UIColor(red: 100, green: 165, blue: 175, alpha: 1).cgColor
        lblNome.layer.borderWidth = 2
        lblNome.layer.cornerRadius = 10
    }
    
}
