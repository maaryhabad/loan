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
extension AdicionarViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print(code)
        controller.reset()
    }
}

//Use BarcodeScannerErrorDelegate when you want to handle session errors.
extension AdicionarViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }
}

//Use BarcodeScannerDismissalDelegate to handle "Close button" tap. Please note that BarcodeScannerViewController doesn't dismiss itself if it was presented initially.
extension AdicionarViewController: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
