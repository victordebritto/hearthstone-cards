//
//  UIViewController+Extensions.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 31/10/22.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, actionTitle: String, handler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: actionTitle, style: .default) { _ in
            handler?()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
    
}
