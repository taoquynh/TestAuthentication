//
//  AlertHelper.swift
//  TestAuthenticate
//
//  Created by Taof on 3/27/21.
//

import UIKit

class AlertHelper {
    class func showAlert(message: String, viewController: UIViewController){
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alertController = UIAlertController(title: "Thông báo", message: message, preferredStyle: .actionSheet)
        alertController.addAction(alertAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
