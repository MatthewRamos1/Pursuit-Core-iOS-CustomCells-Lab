//
//  UIViewController + Alerts.swift
//  ProgrammaticUserCells
//
//  Created by Matthew Ramos on 2/2/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
