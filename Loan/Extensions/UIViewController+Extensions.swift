//
//  UIViewController+Extensions.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 25/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
