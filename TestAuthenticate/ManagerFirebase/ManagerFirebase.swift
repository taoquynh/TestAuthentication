//
//  ManagerFirebase.swift
//  TestAuthenticate
//
//  Created by Taof on 3/27/21.
//

import Foundation
import FirebaseAuth

class FirebaseAuthManager {
    
    static let shared = FirebaseAuthManager()
    
    // hàm đăng ký
    func register(email: String, password: String, completion: @escaping ((_ success: Bool) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) { (userResult, error) in
            if let user = userResult?.user {
                print("Phone: ", user.phoneNumber ?? "")
                completion(true)
            } else {
                print("Error: ", error ?? "")
                completion(false)
            }
        }
    }
    
    // hàm đăng nhập
    func login(email: String, password: String, completion: @escaping ((_ success: Bool) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { (userResult, error) in
            if let error = error {
                print("Error: ", error)
                completion(false)
            } else {
                completion(true)
                if let user = userResult?.user {
                    print("User id: \(user.uid)")
                }
            }
        }
    }
    
    // hàm đăng xuất
    func logout(completion: @escaping ((_ success: Bool) -> Void)) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch let signOutError as NSError {
            print("Error: \(signOutError)")
            completion(false)
        }
    }
}
