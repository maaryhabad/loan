//
//  BarCode+Extensions.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 13/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import BarcodeScanner

//Use BarcodeScannerCodeDelegate when you want to get the captured code back.
extension dashboardViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {

        DAOGoogleBooksAPI.getBook(ISBN: code){ livro in
            
            controller.dismiss(animated: true, completion: nil)
            
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "livro") as? LivroViewController {
                if livro != nil {
                    vc.livroSelecionado = livro
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

//Use BarcodeScannerErrorDelegate when you want to handle session errors.
extension dashboardViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }
}

//Use BarcodeScannerDismissalDelegate to handle "Close button" tap. Please note that BarcodeScannerViewController doesn't dismiss itself if it was presented initially.
extension dashboardViewController: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
        controller.reset()
    }
}
