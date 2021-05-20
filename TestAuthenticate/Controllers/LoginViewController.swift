//
//  LoginViewController.swift
//  TestAuthenticate
//
//  Created by Taof on 3/27/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onLogin(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        FirebaseAuthManager.shared.login(email: email, password: password) { (status) in
            var message = ""
            if status {
                let userDefault = UserDefaults.standard
                userDefault.setValue("login", forKey: "login")
                let homeVC = HomeViewController()
                let navigation = UINavigationController(rootViewController: homeVC)
                navigation.modalPresentationStyle = .fullScreen
                self.present(navigation, animated: true, completion: nil)
            } else {
                message = "Lỗi khi đăng nhập"
                AlertHelper.showAlert(message: message, viewController: self)
            }
        }
    }
    
    @IBAction func onRegister(_ sender: Any) {
        let registerVC = RegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        present(registerVC, animated: true, completion: nil)
    }
}
