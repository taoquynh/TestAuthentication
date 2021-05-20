//
//  RegisterViewController.swift
//  TestAuthenticate
//
//  Created by Taof on 3/27/21.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onRegister(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        FirebaseAuthManager.shared.register(email: email, password: password) { (status) in
            var message = ""
            if status {
                message = "Tạo tài khoản thành công, mời đăng nhập."
                AlertHelper.showAlert(message: message, viewController: self)
            } else {
                message = "Lỗi khi tạo tài khoản"
                AlertHelper.showAlert(message: message, viewController: self)
            }
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
