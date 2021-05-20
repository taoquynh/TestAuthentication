//
//  HomeViewController.swift
//  TestAuthenticate
//
//  Created by Taof on 3/27/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToCreateVC))
        
        
        let listButton = UIBarButtonItem(title: "List", style: .done, target: self, action: #selector(getListData))
        
        navigationItem.rightBarButtonItems = [addButton, listButton]
        
    }
    
    @objc func getListData(){
        let listVC = ListBookViewController()
        
        navigationController?.pushViewController(listVC, animated: true)
    }
    
    @objc func goToCreateVC(){
        let createVC = CreateViewController()
        navigationController?.pushViewController(createVC, animated: true)
    }
    
    @IBAction func onLogout(_ sender: Any) {
        FirebaseAuthManager.shared.logout { [weak self] (success) in
            guard let strongSelf = self else {
                return
            }
            
            if success {
                UserDefaults.standard.removeObject(forKey: "login")
                strongSelf.dismiss(animated: true, completion: nil)
            } else {
                let message = "Đăng xuất không thành công"
                AlertHelper.showAlert(message: message, viewController: strongSelf)
            }
        }
    }
    
}
